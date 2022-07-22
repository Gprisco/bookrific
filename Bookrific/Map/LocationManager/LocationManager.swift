//
//  LocationManager.swift
//  Bookrific
//
//  Created by Giovanni Prisco on 19/07/22.
//

import MapKit
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {
    private var manager = CLLocationManager()
    
    @Published var region = MKCoordinateRegion() {
        didSet {
            updateAds()
        }
    }
    @Published var ads = [Ad]()
    
    private var timer: Timer? = nil
        
    override init() {
        super.init()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locations.last.map {
            region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: $0.coordinate.latitude, longitude: $0.coordinate.longitude),
                span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
            )
            
            if ads.isEmpty {
                ads = AdManager.getAds(limit: 10, region: region)
            }
        }
    }
    
    private func updateAds() {
        if timer != nil {
            timer!.invalidate()
            timer = nil
        }
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false) { [self] (timer) in
            print("Updating Ads...")
            ads = AdManager.getAds(limit: 10, region: region)
        }
        
        RunLoop.current.add(timer!, forMode: .common)
    }
}
