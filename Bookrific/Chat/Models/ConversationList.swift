//
//  ConversationList.swift
//  Bookrific
//
//  Created by Giovanni Prisco on 22/07/22.
//

import Foundation

public class ConversationList: ObservableObject {
    @Published var conversations: [Conversation]
    
    public init(conversations: [Conversation]) {
        self.conversations = conversations
    }
}
