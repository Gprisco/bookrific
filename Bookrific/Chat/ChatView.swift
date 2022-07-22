//
//  ChatView.swift
//  Bookrific
//
//  Created by Giovanni Prisco on 22/07/22.
//

import SwiftUI

struct ChatView: View {
    @State var typingMessage: String = ""
    @Binding var conversation: Conversation
    
    private enum Field: Int, Hashable {
        case texting
    }
    @FocusState private var focusedField: Field?
    
    var body: some View {
        VStack {
            List {
                ForEach(conversation.messages, id: \.self) { msg in
                    MessageView(message: msg)
                        .listRowSeparator(.hidden)
                }
            }
            .listStyle(.plain)
            
            HStack {
                Image(systemName: "paperclip.circle")
                
                TextField("Messaggio...", text: $typingMessage)
                    .focused($focusedField, equals: .texting)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(minHeight: CGFloat(30))
                
                Button(action: {
                    let msg = typingMessage.trimmingCharacters(in: .whitespaces)
                    if msg.count == 0 {
                        focusedField = .texting
                        return
                    }
                    
                    let lastId = conversation.messages.last?.id ?? 0

                    conversation.messages.append(Message(id: lastId + 1, from: nil, message: msg, attachments: nil))
                    
                    typingMessage = ""
                    focusedField = nil
                }) {
                    Text("Invia")
                }
            }.frame(minHeight: CGFloat(50)).padding()
        }
        .navigationTitle("\(conversation.recipient.name) \(conversation.recipient.surname)")
    }
}

