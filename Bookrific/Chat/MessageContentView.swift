//
//  MessageContentView.swift
//  Bookrific
//
//  Created by Giovanni Prisco on 22/07/22.
//

import SwiftUI

struct MessageContentView: View {
    var messageContent: String
    var isCurrentUser: Bool
    
    var body: some View {
        Text(messageContent)
            .padding(10)
            .foregroundColor(isCurrentUser ? Color.white : Color.black)
            .background(isCurrentUser ? Color.accentColor : Color(UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)))
            .cornerRadius(10)
    }
}

struct MessageContentView_Previews: PreviewProvider {
    static var previews: some View {
        MessageContentView(messageContent: "Hello!", isCurrentUser: true)
        MessageContentView(messageContent: "Hello!", isCurrentUser: false)
    }
}
