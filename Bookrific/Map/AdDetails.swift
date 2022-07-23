//
//  AdDetails.swift
//  Bookrific
//
//  Created by Giovanni Prisco on 21/07/22.
//

import SwiftUI
import MapKit

struct AdDetails: View {
    @Binding var ad: Ad?
    
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 43.0, longitude: 11.0), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    @State private var selectedImage: Image?
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: true) {
                HStack(alignment: .center) {
                    Image(systemName: "person.fill")
                        .resizable()
                        .frame(width: 40, height: 40, alignment: .center)
                        .cornerRadius(20)
                    
                    VStack(alignment: .leading) {
                        Text("\(ad!.user.name) \(ad!.user.surname)")
                            .bold()
                        Text("\(ad!.title) - \(ad!.author)")
                    }
                }
                .padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 0))
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: [GridItem(.flexible())], alignment: .center) {
                        ForEach(ad!.photos, id: \.self) { image in
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 100)
                                .aspectRatio(1, contentMode: .fit)
                                .clipped()
                        }
                    }
                    .padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 0))
                }
                
                Map(coordinateRegion: $region, interactionModes: .init(), showsUserLocation: false, userTrackingMode: .none, annotationItems: [ad!]) {
                    MapPin(coordinate: $0.location, tint: .accentColor)
                }
                .onAppear(perform: {
                    region.center = CLLocationCoordinate2D(latitude: ad!.location.latitude, longitude: ad!.location.longitude)
                }).frame(height: 200.0, alignment: .center)
                    .padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 0))
                
                Text(ad!.description)
                    .padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 0))
                
                Button(action: {
                    print("Scambio")
                }) {
                    Text("Proponi Scambio")
                        .padding(10)
                }
                .padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 0))
                .buttonStyle(.borderedProminent)
            }
            .navigationTitle("Dettagli")
            .navigationBarTitleDisplayMode(.inline)
            .padding(.horizontal, 20)
        }
    }
}

struct AdDetails_Previews: PreviewProvider {
    static var previews: some View {
        AdDetails(ad: Binding(get: { Ad(lat: 43.0, long: 11.0, author: "Philip Knight", title: "L'arte della Vittoria", description: "Libro meraviglioso", user: UserProfile(id: 1, name: "John", surname: "Doe"), photos: [UIImage(named: "book1")!, UIImage(named: "book1.1")!, UIImage(named: "book1.2")!]) }, set: {_ in}))
    }
}
