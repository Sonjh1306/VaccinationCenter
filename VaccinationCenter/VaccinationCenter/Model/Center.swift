import Foundation

struct CenterResponse: Decodable {
    
    let currentCount: Int
    let data: [Center]
    
}

struct Center: Decodable {

    let id: Int
    let centerName: String
    let sido: String
    let sigungu: String
    let facilityName: String
    let zipCode: String
    let address: String
    let lat: String
    let lng: String
    let createdAt: String
    let updatedAt: String
    let centerType: String
    let org: String
    let phoneNumber: String

}

struct CenterDetail {
    
    var id: Int
    var centerName: String
    var facilityName: String
    var phoneNumber: String
    var updatedAt: String
    var address: String
    var lat: String
    var lng: String
    
}
