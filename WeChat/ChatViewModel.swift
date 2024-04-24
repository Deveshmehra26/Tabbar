//
//  ChatViewModel.swift
//  WeChat
//
//  Created by Kamal Harariya on 4/21/24.
//

import Foundation

enum ChatType: Int, Codable {
    case archive, chat
}

enum MessageStatus: String, Codable {
    case delivered, read, unread, deliveredNotRead
}

struct ChatMessage: Decodable {
    let id: String
    let sender: String
    let message: String
    let time: TimeInterval
}

struct ChatHeaderItem: Decodable {
    let name: String
    let imageName: String 
}

struct ChatHeader: Decodable {
    let title: String
    let left: [ChatHeaderItem]
    let right: [ChatHeaderItem]
}

struct ChatDataModel: Decodable {
    let type: ChatType
    let id: String
    let name: String
    let image: String
    let isMuted: Bool?
    let isUnread: Bool?
    let status: MessageStatus?
    let messages: [ChatMessage]?
}

struct ChatData: Decodable {
    let header: ChatHeader
    let chats: [ChatDataModel]
}

enum ChatError: Error {
    case fileNotFound
    case otherErrors
}

class ChatViewModel {
    var chatData: ChatData?
    
    func numberOfRows() -> Int {
        return chatData?.chats.count  ?? 0
    }
    
    func message(at index: Int) -> ChatDataModel? {
        let total = chatData?.chats.count ?? 0
        if index < total, let data = chatData?.chats[index] {
            return data
        }
        return nil 
    }
    
    func getChatList(completion: (Result<Bool, ChatError>) -> Void) {
        if let fileUrl = Bundle.main.url(forResource: "ChatData", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileUrl)
                chatData = try JSONDecoder().decode(ChatData.self, from: data)
                completion(.success(true))
            } catch {
                print("error:\(error)")
            }
        }
    }
}
