//
//  ContentView.swift
//  TalkToMe
//
//  Created by 塚田夏美 on 2026/03/16.
//

import SwiftUI

struct ContentView: View {
    @State var messages: [Message] = []
    @State var inputText: String = ""
    
    var body: some View {
        VStack(spacing: 0) {
            // ヘッダー
            VStack {
                Text("Talk to Me!")
                    .font(.title)
                    .foregroundStyle(Color.white)
                    .padding()
                    .frame(maxWidth: .infinity,alignment: .top)
            }
            .background(Color.pink)
            
            // 会話エリア
            ScrollView() {
                ForEach(messages) { message in
                    Text(message.messageText)
                }
            }
                
            // 文字入力エリア
            HStack {
                TextField("talk to me", text: $inputText)
                    .textFieldStyle(.roundedBorder)
                Button("", systemImage: "paperplane") {
                    Task {
                        await submit()
                    }
                }
            }
            .padding()
            .frame(alignment: .bottom)
        }
    }
    
    // 送信ボタン押下時のアクション
    func submit() async {
        let message = Message(id: UUID(), messageText: inputText, isFromUser: true)
        if (inputText != "") {
            messages.append(message)
            // AIにメッセージ送信
            await sendToAi(content: inputText)
        }
        // 送信後にinputTextを空にして次の文字列を入力できるようにする
        inputText = ""
    }
    
    @MainActor func sendToAi(content: String) async {
        let ai = GeminiAPIPractice()
        let responce = await ai.callAPI(prompt: content)
        let message = Message(id: UUID(), messageText: responce, isFromUser: false)
        messages.append(message)
    }
}

#Preview {
    ContentView()
}
