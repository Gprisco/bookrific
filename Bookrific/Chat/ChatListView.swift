//
//  Chat.swift
//  Bookrific
//
//  Created by Giovanni Prisco on 21/07/22.
//

import SwiftUI

struct ChatListView: View {
    @ObservedObject var conversations = ConversationManager.getConversations()
    
    var body: some View {
        List(conversations.conversations) { chat in
            NavigationLink(destination: ChatView(conversation: chat)) {
                HStack {
                    Image(systemName: "person.circle")
                        .frame(width: 50, height: 50, alignment: .center)
                    
                    VStack(alignment: .leading) {
                        Text("\(chat.recipient.name) \(chat.recipient.surname)")
                            .bold()
                        
                        Text((chat.messages.last!.from == nil ? "Tu: " : "") + (chat.messages.last!.message ?? "\(chat.messages.last!.attachments!.count) Allegati"))
                            .fontWeight(.light)
                    }
                }
            }
        }
        .navigationTitle("Chat")
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatListView()
    }
}
