import Foundation
import MapKit

class Marker: NSObject, MKAnnotation {
    
  let title: String?
  let coordinate: CLLocationCoordinate2D

  init(
    title: String?,
    coordinate: CLLocationCoordinate2D
  ) {
    self.title = title
    self.coordinate = coordinate

    super.init()
  }

}
