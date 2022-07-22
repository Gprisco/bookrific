//
//  ItalyMap.swift
//  Bookrific
//
//  Created by Giovanni Prisco on 19/07/22.
//

import SwiftUI
import MapKit

struct BookMap: View {
    @State var isBottomSheetOpen = false
    @State var selectedAd: Ad? = nil {
        didSet {
            isBottomSheetOpen.toggle()
        }
    }
    @StateObject private var locationManager = LocationManager()
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $locationManager.region, showsUserLocation: true, userTrackingMode: .none, annotationItems: locationManager.ads) { ad in
                MapAnnotation(coordinate: ad.location) {
                    Image(systemName: "book.circle")
                        .resizable()
                        .foregroundColor(.accentColor)
                        .frame(width: 30, height: 30)
                        .background(.white)
                        .clipShape(Circle())
                        .onTapGesture {
                            print("Tapped \(ad.id)")
                            selectedAd = ad
                        }
                }
            }
        }
        .sheet(isPresented: $isBottomSheetOpen) {
            AdDetails(ad: $selectedAd)
        }
    }
}

struct BookMap_Previews: PreviewProvider {
    static var previews: some View {
        BookMap()
    }
}
