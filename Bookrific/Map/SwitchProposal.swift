//
//  SwitchProposal.swift
//  Bookrific
//
//  Created by Giovanni Prisco on 23/07/22.
//

import SwiftUI

struct SwitchProposal: View {
    var ad: Ad
    @State var selectedBooks: Set<Int> = Set()
    @Binding var isSheetPresented: Bool
    
    @State var searchText: String = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                TextField("Cerca...", text: $searchText)
                    .padding(20)
                    .textFieldStyle(.roundedBorder)
                
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], alignment: .center, spacing: 5.0, pinnedViews: .sectionHeaders) {
                    ForEach(DB.books.filter({ searchText.trimmingCharacters(in: .whitespaces).isEmpty || $0.title.contains(searchText) || $0.author.contains(searchText) }), id: \.id) { book in
                        VStack(alignment: .center) {
                            ZStack(alignment: .center) {
                                Image(uiImage: book.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                                    .aspectRatio(1, contentMode: .fill)
                                    .opacity(selectedBooks.contains(book.id) ? 0.5 : 1)
                                
                                if selectedBooks.contains(book.id) {
                                    Image(systemName: "checkmark.circle")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(minWidth: 0, maxWidth: 100, minHeight: 0, maxHeight: 100)
                                        .aspectRatio(1, contentMode: .fill)
                                        .foregroundColor(.accentColor)
                                }
                            }
                            
                            Text(book.title)
                                .bold()
                                .multilineTextAlignment(.center)
                            
                            Text(book.author)
                                .font(.caption)
                                .multilineTextAlignment(.center)
                        }
                        .onTapGesture {
                            if selectedBooks.contains(book.id) {
                                selectedBooks.remove(book.id)
                            } else {
                                selectedBooks.insert(book.id)
                            }
                        }
                    }
                }
                .padding()
                .navigationTitle("Proponi libri")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar(content: {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button(action: {
                            let books: [Book] = DB.books.filter({ selectedBooks.contains($0.id) })
                            
                            let images: [UIImage] = books.map({ $0.image })
                            
                            ConversationManager.shared.createConversation(recipient: ad.user, messages: [
                                Message(id: 1, from: nil, message: "Ciao, ti propongo questi libri in cambio del tuo '\(ad.title)' di '\(ad.author)'", attachments: nil),
                                Message(id: 2, from: nil, attachments: images)
                            ])
                            isSheetPresented.toggle()
                        }) {
                            Text("Fatto")
                        }
                    }
                })
            }
        }
    }
}

struct SwitchProposal_Previews: PreviewProvider {
    static var previews: some View {
        SwitchProposal(ad: Ad(lat: 43.0, long: 11.0, author: "Ciao", title: "Ciao", description: "Ciao", user: UserProfile(id: 1, name: "John", surname: "Doe"), photos: []), isSheetPresented: Binding(get: { true }, set: {_ in}))
    }
}
