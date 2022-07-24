//
//  BookMapView.swift
//  Bookrific
//
//  Created by Giovanni Prisco on 22/07/22.
//

import SwiftUI

struct BookMapView: View {
    @Binding var selectedPage: Int
    @State var searchText: String = ""
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            BookMap()
            
            HStack(alignment: .center) {
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .padding(8)
                        .frame(maxHeight: 60, alignment: .center)
                        .foregroundColor(.white)
                    
                    TextField("Cerca...", text: $searchText)
                        .padding(25)
                }
                
                Button(action:  { withAnimation { selectedPage = PAGES.CHAT.rawValue } }) {
                    Image(systemName: "message")
                        .frame(width: 45, height: 45, alignment: .center)
                        .background(.white)
                        .clipShape(Circle())
                }
                .padding(15)
            }
        }
        .navigationTitle("Scopri")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct BookMapView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BookMapView(selectedPage: Binding(get: { 1 }, set: { _ in }))
        }
    }
}
