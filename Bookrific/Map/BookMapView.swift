//
//  BookMapView.swift
//  Bookrific
//
//  Created by Giovanni Prisco on 22/07/22.
//

import SwiftUI

struct BookMapView: View {
    @Binding var selectedPage: Int
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            BookMap()
            
            Button(action:  { withAnimation { selectedPage = PAGES.CHAT.rawValue } }) {
                Image(systemName: "message")
                    .frame(width: 45, height: 45, alignment: .center)
                    .background(.white)
                    .clipShape(Circle())
            }
            .padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 15))
        }
    }
}

struct BookMapView_Previews: PreviewProvider {
    static var previews: some View {
        BookMapView(selectedPage: Binding(get: { 1 }, set: { _ in }))
    }
}
