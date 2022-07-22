//
//  AdManager.swift
//  Bookrific
//
//  Created by Giovanni Prisco on 19/07/22.
//

import MapKit

class AdManager {
    
    // Create a bunch of random ads in the current region
    public static func getAds(limit: Int, region: MKCoordinateRegion) -> [Ad] {
        var ads = [Ad]()
        
        for i in 0...limit {
            
            // Get random deltas for generating scattered markers
            var latDelta = Double.random(in: (0-region.span.latitudeDelta/2)...(region.span.latitudeDelta/2))
            var longDelta = Double.random(in: (0-region.span.longitudeDelta/2)...(region.span.longitudeDelta/2))
            
            // Imagine the map divided in 4 like a cartesian plane, we want the markers to be in every region of this plane
            switch(i % 4) {
            case 0:
                break;
            case 1:
                latDelta = 0 - latDelta
                break;
            case 2:
                longDelta = 0 - longDelta
                break;
            case 3:
                latDelta = 0 - latDelta
                longDelta = 0 - longDelta
                break;
                
            default:
                break;
            }
            
            ads.append(contentsOf: [Ad(lat: region.center.latitude + Double(latDelta), long: region.center.longitude + Double(longDelta), author: "Ray Wenderlich", title: "Real-World iOS by Tutorials", description: "Very nice book")])
        }
        
        return ads
    }
}
