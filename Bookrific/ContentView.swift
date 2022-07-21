//
//  ContentView.swift
//  Bookrific
//
//  Created by Giovanni Prisco on 19/07/22.
//

import SwiftUI

enum PAGES: Int {
    case MAP = 0
    case CHAT = 1
}

struct ContentView: View {
    @State private var selectedPage = 0

    var body: some View {
        TabView {
            TabView(selection: $selectedPage) {
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
                .tag(0)
                Text("Chat")
                    .tag(1)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .tabItem {
                Label("Scopri", systemImage: "map")
            }
            
            Text("Inserisci Inserzione!")
                .tabItem {
                    Label("Inserisci", systemImage: "plus.circle")
                }
            
            Text("Profilo!")
                .tabItem {
                    Label("Profilo", systemImage: "person")
                }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
