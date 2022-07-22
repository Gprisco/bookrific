//
//  MessageView.swift
//  Bookrific
//
//  Created by Giovanni Prisco on 22/07/22.
//

import SwiftUI

struct MessageView: View {
    @Binding var message: Message
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 15) {
            if message.from != nil {
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 40, height: 40, alignment: .center)
                    .cornerRadius(20)
            } else {
                Spacer()
            }
            
            MessageContentView(messageContent: message.message ?? "",
                               isCurrentUser: false)
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(message: Binding(get: {Message(id: 1, from: nil, message: "Hello!", attachments: nil)}, set: { _ in }))
    }
}
