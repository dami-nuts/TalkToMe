//
//  MessageModel.swift
//  TalkToMe
//
//  Created by 塚田夏美 on 2026/03/20.
//
// 「誰が」「何を」話したかを保持する構造体
import Foundation

struct Message: Identifiable{
    let id: UUID
    let messageText: String
    let isFromUser: Bool
}
