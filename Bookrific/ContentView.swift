//
//  ContentView.swift
//  Bookrific
//
//  Created by Giovanni Prisco on 19/07/22.
//

import SwiftUI
import AuthenticationServices

public enum PAGES: Int {
    case MAP = 0
    case CHAT = 1
}

struct ContentView: View {
    @State private var selectedPage = 0
    
    var body: some View {
        TabView {
            NavigationView {
                TabView(selection: $selectedPage) {
                    BookMapView(selectedPage: $selectedPage)
                        .navigationTitle("Scopri")
                        .navigationBarTitleDisplayMode(.inline)
                        .tag(0)
                    
                    ChatListView()
                        .navigationTitle("Chat")
                        .tag(1)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            }
            .tabItem {
                Label("Scopri", systemImage: "map")
            }
            
            InsertAdView()
                .navigationTitle("Inserisci")
                .tabItem {
                    Label("Inserisci", systemImage: "plus.circle")
                }
            
            ProfileView()
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
