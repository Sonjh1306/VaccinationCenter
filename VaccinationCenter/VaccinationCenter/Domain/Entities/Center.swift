import Foundation

struct CenterList {
    let list: [Center]
}

struct Center {
    let centerName: String
    let facilityName: String
    let phoneNumber: String
    let updatedAt: String
    let address: String
    let lat: String
    let lng: String
}

struct CenterDetail {
    let centerName: String
    let facilityName: String
    let phoneNumber: String
    let updatedAt: String
    let address: String
}

struct CenterPosition {
    let lat: String
    let lng: String
}
