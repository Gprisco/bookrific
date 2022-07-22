//
//  Conversation.swift
//  Bookrific
//
//  Created by Giovanni Prisco on 22/07/22.
//

import Foundation

public class Conversation: Identifiable, Equatable, ObservableObject {
    public static func == (lhs: Conversation, rhs: Conversation) -> Bool {
        return lhs.id == rhs.id
    }
    
    public var id: Int
    @Published public var recipient: UserProfile
    @Published public var messages: [Message]
    
    public init(id: Int, recipient: UserProfile, messages: [Message]) {
        self.id = id
        self.recipient = recipient
        self.messages = messages
    }
}
