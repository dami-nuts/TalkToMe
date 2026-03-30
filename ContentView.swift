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
                Button(action: submit) {
                    Image(systemName: "paperplane")
                        .foregroundColor(Color.pink)
                }
            }
            .padding()
            .frame(alignment: .bottom)
        }
    }
    
    // 送信ボタン押下時のアクション
    func submit() {
        let message = Message(id: 0, messageText: inputText, isFromUser: true)
        messages.append(message)
        
    }
}

#Preview {
    ContentView()
}
