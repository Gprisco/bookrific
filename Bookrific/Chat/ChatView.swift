//
//  ChatView.swift
//  Bookrific
//
//  Created by Giovanni Prisco on 22/07/22.
//

import SwiftUI

struct ChatView: View {
    @State var typingMessage: String = ""
    @ObservedObject var conversation: Conversation
    
    var body: some View {
        VStack {
            List {
                ForEach($conversation.messages, id: \.self) { $msg in
                    MessageView(message: $msg)
                }
            }
            .listStyle(.plain)
            
            HStack {
                Image(systemName: "paperclip.circle")
                
                TextField("Messaggio...", text: $typingMessage)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(minHeight: CGFloat(30))
                
                Button(action: {
                    let lastId = conversation.messages.last?.id ?? 0
                    print(lastId)
                    conversation.messages.append(Message(id: lastId + 1, from: nil, message: typingMessage, attachments: nil))
                    typingMessage = ""
                }) {
                    Text("Invia")
                }
            }.frame(minHeight: CGFloat(50)).padding()
        }
        .navigationTitle("\(conversation.recipient.name) \(conversation.recipient.surname)")
    }
}

