//
//  InsertAdView.swift
//  Bookrific
//
//  Created by Giovanni Prisco on 23/07/22.
//

import SwiftUI
import MapKit
import LocationPicker

struct InsertAdView: View {
    @State var bookTitle: String = ""
    @State var bookAuthor: String = ""
    @State var adDescription: String = "Descrizione...\n\n"
    @State var isPlaceHolder: Bool = true
    
    @State private var coordinates = CLLocationCoordinate2D(latitude: 43.0, longitude: 11.0)
    @State private var showSheet = false
    
    @State private var showingImagePicker = false
    @State private var inputImages = [UIImage]()
    private var imagesLimit = 5
    
    private var locationManager = LocationManager()
        
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: true) {
                TextField("Titolo Libro", text: $bookTitle)
                    .textFieldStyle(.roundedBorder)
                    .padding(10)
                
                TextField("Autore", text: $bookAuthor)
                    .textFieldStyle(.roundedBorder)
                    .padding(10)
                
                TextEditor(text: $adDescription)
                    .foregroundColor(isPlaceHolder ? .gray : .primary)
                    .onTapGesture {
                        if isPlaceHolder {
                            adDescription = ""
                            isPlaceHolder.toggle()
                        }
                    }
                    .overlay(content: {
                        RoundedRectangle(cornerRadius: 3.0)
                            .stroke(lineWidth: 1.0)
                            .foregroundColor(.gray)
                    })
                    .padding(10)
                
                Button(action: {
                    showSheet.toggle()
                }, label: {
                    HStack(alignment: .center) {
                        Image(systemName: "mappin.circle.fill")
                        Text("Posizione: \(coordinates.latitude), \(coordinates.longitude)")
                    }
                })
                .buttonStyle(.bordered)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(inputImages, id: \.self) { img in
                            ZStack(alignment: .topTrailing) {
                                Image(uiImage: img)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(minWidth: 0, maxWidth: 200, minHeight: 0, maxHeight: 200)
                                    .aspectRatio(1, contentMode: .fill)
                                    .background(.gray)
                                
                                Image(systemName: "x.circle.fill")
                                    .padding(5)
                                    .foregroundColor(.primary)
                                    .onTapGesture {
                                        inputImages.remove(at: inputImages.firstIndex(of: img)!)
                                    }
                            }
                        }
                        
                        Button(action: { showingImagePicker.toggle() }) {
                            ZStack(alignment: .center) {
                                Image("placeholder-image")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(minWidth: 100, maxWidth: 200, minHeight: 100, maxHeight: 200)
                                    .aspectRatio(1, contentMode: .fill)

                                Image(systemName: "plus.circle.fill")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 30, height: 30, alignment: .center)
                            }
                        }
                    }
                }
                .padding(10)
            }
            .navigationTitle("Nuova Inserzione")
            .sheet(isPresented: $showSheet) {
                LocationPicker(instructions: "Fai tap in un punto per selezionare la posizione", coordinates: $coordinates)
            }
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(images: $inputImages, limit: imagesLimit - inputImages.count)
        }
    }
}

struct InsertAdView_Previews: PreviewProvider {
    static var previews: some View {
        InsertAdView()
    }
}
