//
//  ConversationManager.swift
//  Bookrific
//
//  Created by Giovanni Prisco on 21/07/22.
//

import UIKit

public class ConversationManager: ObservableObject {
    @Published public var conversations: [Conversation]
    
    public static let shared = ConversationManager()
    
    public init() {
        conversations = [Conversation]()
        
        let users = DB.users
        
        for user in users {
            let messages = [
                Message(id: 1, from: nil, message: "Ciao, ti propongo questi libri in cambio del tuo"),
                Message(id: 2, from: nil, message: nil, attachments: [
                    UIImage(named: "book1")!,
                    UIImage(named: "book2")!,
                    UIImage(named: "book3")!
                ]),
                Message(id: 3, from: user, message: "Il secondo libro sembra interessante")
            ]
            
            conversations.append(Conversation(id: user.id, recipient: user, messages: messages))
        }
    }
    
    public func createConversation(recipient: UserProfile, messages: [Message]) {
        let conversation = Conversation(id: conversations.last!.id + 1, recipient: recipient, messages: messages)
        conversations.append(conversation)
    }
}
