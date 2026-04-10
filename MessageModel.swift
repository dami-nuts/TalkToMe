//
//  MessageModel.swift
//  TalkToMe
//
//  Created by 塚田夏美 on 2026/03/20.
//
import Foundation
import GoogleGenerativeAI

// 「誰が」「何を」話したかを保持する構造体
struct Message: Identifiable{
    let id: UUID
    let messageText: String
    let isFromUser: Bool
}

// AIのAPI呼び出し
private let apiKey = "AIzaSyAfjcXtE8ptCuOlIKfFD7LOiXAX_7Cw24w"

class GeminiAPIPractice {
    let model: GenerativeModel
    let chat: Chat
    init() {
        // APIを使うための準備。モデルとチャットを用意する
        model = GenerativeModel(name: "gemini-2.5-flash", apiKey: apiKey)
        chat = model.startChat()
    }

    func callAPI(prompt: String) async -> String {
        do {
            // Gemini APIにユーザ入力を送信
            let response = try await chat.sendMessage(prompt)
            return response.text!
        } catch {
            return error.localizedDescription
        }
    }
}
