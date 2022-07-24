//
//  ProfileView.swift
//  Bookrific
//
//  Created by Giovanni Prisco on 24/07/22.
//

import SwiftUI

struct ProfileView: View {
    @State var name: String = "Jon"
    @State var surname: String = "Doe"
    
    @State private var showingImagePicker = false
    @State var inputImages: [UIImage] = []
    private var imagePickerLimit = 1
    
    var body: some View {
        NavigationView {
            ScrollView {
                ZStack(alignment: .bottomTrailing) {
                    if ((inputImages.first) != nil) {
                        Image(uiImage: inputImages.first!)
                            .resizable()
                            .scaledToFit()
                            .frame(minWidth: 0, maxWidth: 150, minHeight: 0, maxHeight: 150)
                            .aspectRatio(1, contentMode: .fill)
                    } else {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(minWidth: 0, maxWidth: 150, minHeight: 0, maxHeight: 150)
                            .aspectRatio(1, contentMode: .fill)
                    }
                    
                    Button(action: {
                        if inputImages.first != nil {
                            inputImages.remove(at: 0)
                        }
                        showingImagePicker.toggle()
                    }) {
                        Image(systemName: "pencil")
                    }
                }
                
                TextField("Nome", text: $name)
                    .padding(10)
                    .textFieldStyle(.roundedBorder)
                
                TextField("Cognome", text: $surname)
                    .padding(10)
                    .textFieldStyle(.roundedBorder)
                
                Button(action: {
                    print("Saving data...")
                }) {
                    Text("Salva")
                        .padding(10)
                        .frame(minWidth: 0, maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .padding([.leading, .trailing], 20)
            }
            .navigationTitle("Profilo")
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(images: $inputImages, limit: imagePickerLimit)
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
