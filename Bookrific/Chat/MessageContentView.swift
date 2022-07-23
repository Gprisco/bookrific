//
//  MessageContentView.swift
//  Bookrific
//
//  Created by Giovanni Prisco on 22/07/22.
//

import SwiftUI

struct MessageContentView: View {
    var message: Message
    
    var body: some View {
        VStack {
            if message.message != nil {
                AnyView(Text(message.message!)
                    .padding(10)
                    .foregroundColor(message.from == nil ? Color.white : Color.black)
                    .background(message.from == nil ? Color.accentColor : Color(UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)))
                    .cornerRadius(10))
            } else if message.attachments != nil {
                AnyView(
                    ScrollView(.vertical, showsIndicators: true) {
                        LazyVGrid(
                            columns: [GridItem(.flexible()), GridItem(.flexible())],
                            alignment: .center
                        ) {
                            ForEach(message.attachments!, id: \.self) { image in
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                                    .aspectRatio(1, contentMode: .fill)
                            }
                        }
                            .padding(10)
                            .foregroundColor(message.from == nil ? Color.white : Color.black)
                            .background(message.from == nil ? Color.accentColor : Color(UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)))
                            .cornerRadius(10)
                    }
                )
            }
        }
    }
}

struct MessageContentView_Previews: PreviewProvider {
    static var previews: some View {
        MessageContentView(message: Message(id: 1, from: nil, message: "hello", attachments: nil))
        MessageContentView(message: Message(id: 2, from: UserProfile(id: 1, name: "john", surname: "Doe"), message: "Hello", attachments: nil))
        MessageContentView(message: Message(id: 3, from: nil, message: nil, attachments: [UIImage(named: "book1")!, UIImage(named: "book2")!]))
        MessageContentView(message: Message(id: 3, from: nil, message: nil, attachments: [UIImage(named: "book1")!]))
        MessageContentView(message: Message(id: 3, from: nil, message: nil, attachments: [UIImage(named: "book1")!, UIImage(named: "book2")!, UIImage(named: "book3")!, UIImage(named: "book1.1")!, UIImage(named: "book1.2")!]))
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
