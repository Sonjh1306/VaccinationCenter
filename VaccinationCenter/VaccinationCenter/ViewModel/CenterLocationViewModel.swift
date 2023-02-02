import Foundation
import MapKit

class CenterLocationViewModel {
    
    private var name: String
    private var lat: String
    private var lng: String
    
    init() {
        self.name = ""
        self.lat = ""
        self.lng = ""
    }
    
    func setInformation(name: String, lat: String, lng: String) {
        self.name = name
        self.lat = lat
        self.lng = lng
    }
    
    func annotation() -> Marker? {
        guard let lat = Double(self.lat), let lng = Double(self.lng) else {
            return nil
        }
        return Marker(title: self.name, coordinate: CLLocationCoordinate2D(latitude: lat, longitude: lng))
    }
    
    func region() -> MKCoordinateRegion? {
        guard let lat = Double(self.lat), let lng = Double(self.lng) else {
            return nil
        }
        let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lng)
        return MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    }
    
    func nameInformation() -> String {
        return self.name
    }
    
    func latInformation() -> String {
        return self.lat
    }
    
    func lngInformation() -> String {
        return self.lng
    }
}

