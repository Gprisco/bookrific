//
//  IdentifiablePlace.swift
//  Bookrific
//
//  Created by Giovanni Prisco on 19/07/22.
//

import MapKit

struct Ad: Identifiable {
    let id: UUID
    
    var location: CLLocationCoordinate2D
    let author: String
    let title: String
    let description: String
    
    let photos: [UIImage]
    
    init(id: UUID = UUID(), lat: Double, long: Double, author: String, title: String, description: String) {
        self.id = id
        
        self.location = CLLocationCoordinate2D(
            latitude: lat,
            longitude: long)
        self.author = author
        self.title = title
        self.description = description
        
        self.photos = [UIImage]()
    }
}