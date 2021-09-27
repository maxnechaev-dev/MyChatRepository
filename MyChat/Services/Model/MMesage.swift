//
//  MMesage.swift
//  MyChat
//
//  Created by Max Nechaev on 27.09.2021.
//

import UIKit
import FirebaseFirestore
import MessageKit

struct MMesage: Hashable, MessageType {
    
    var sender: SenderType
        
    let content: String
    let sentDate: Date
    let id: String?
    
    var messageId: String {
        return id ?? UUID().uuidString
    }
    
    var kind: MessageKind {
        return .text(content)
    }

    
    var representation: [String : Any] {
        var rep: [String: Any] = [
            "created": sentDate,
            "senderID": sender.senderId,
            "senderName": sender.displayName,
            "content": content
        ]
        return rep
    }
    
    init(user: MUser, content: String) {
        self.content = content
        sender = Sender(senderId: user.id, displayName: user.username)
        sentDate = Date()
        id = nil
    }
    
    init?(document: QueryDocumentSnapshot) {
        let data = document.data()
        guard let sentDate = data["created"] as? Timestamp else { return nil }
        guard let senderId = data["senderID"] as? String else { return nil }
        guard let senderName = data["senderName"] as? String else { return nil }
        guard let content = data["content"] as? String else { return nil }
        
        self.id = document.documentID
        self.sentDate = sentDate.dateValue()
        sender = Sender(senderId: senderId, displayName: senderName)
        self.content = content
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(messageId)
    }
    
    static func == (lhs: MMesage, rhs: MMesage) -> Bool {
        return lhs.messageId == rhs.messageId
    }
}

extension MMesage: Comparable {
    static func < (lhs: MMesage, rhs: MMesage) -> Bool {
        return lhs.sentDate < rhs.sentDate
    }
    
    
}
