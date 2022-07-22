//
//  Conversation.swift
//  Bookrific
//
//  Created by Giovanni Prisco on 22/07/22.
//

import Foundation

public struct Conversation: Identifiable, Equatable {
    public static func == (lhs: Conversation, rhs: Conversation) -> Bool {
        return lhs.id == rhs.id
    }
    
    public var id: Int
    public var recipient: UserProfile
    public var messages: [Message]
}
