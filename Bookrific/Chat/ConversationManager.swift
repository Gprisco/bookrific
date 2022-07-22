//
//  ConversationManager.swift
//  Bookrific
//
//  Created by Giovanni Prisco on 21/07/22.
//

import UIKit

public class ConversationManager {
    public static func getConversations() -> ConversationList {
        let users = [
            UserProfile(id: 1, name: "Giovanni", surname: "Prisco"),
            UserProfile(id: 2, name: "Simona", surname: "Ventura"),
            UserProfile(id: 3, name: "Bryan", surname: "Adams"),
            UserProfile(id: 4, name: "Chandler", surname: "Bing"),
        ]
        
        var conversations = [Conversation]()
        
        for user in users {
            let messages = [
                Message(id: 1, from: nil, message: "Ciao"),
                Message(id: 2, from: nil, message: nil, attachments: [
                    UIImage(named: "book1")!,
                    UIImage(named: "book2")!
                ])
            ]
            
            conversations.append(Conversation(id: user.id, recipient: user, messages: messages))
        }
        
        return ConversationList(conversations: conversations)
    }    
}
