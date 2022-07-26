//
//  Chat.swift
//  Bookrific
//
//  Created by Giovanni Prisco on 21/07/22.
//

import SwiftUI

struct ChatListView: View {
    @ObservedObject var conversationManager = ConversationManager.shared
    
    var body: some View {
        List {
            ForEach($conversationManager.conversations) { $chat in
                NavigationLink(destination: ChatView(conversation: $chat)) {
                    HStack {
                        Image(systemName: "person.fill")
                            .resizable()
                            .frame(width: 40, height: 40, alignment: .center)
                            .cornerRadius(20)
                        
                        VStack(alignment: .leading) {
                            Text("\(chat.recipient.name) \(chat.recipient.surname)")
                                .bold()
                            
                            Text((chat.messages.last!.from == nil ? "Tu: " : "") + (chat.messages.last!.message ?? "\(chat.messages.last!.attachments!.count) Allegati"))
                                .fontWeight(.light)
                        }
                    }
                }
            }
            .onDelete(perform: { offsets in
                conversationManager.conversations.remove(atOffsets: offsets)
            })
        }
        .navigationTitle("Chat")
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ChatListView()
        }
    }
}
