import Foundation

class DetailViewModel {
    
    private var detail: CenterDetail?
    
    init() {
        self.detail = nil
    }
    
    func configureDetail(center: Center) {
        self.detail = CenterDetail(id: center.id, centerName: center.centerName, facilityName: center.facilityName, phoneNumber: center.phoneNumber, updatedAt: center.updatedAt, address: center.address, lat: center.lat, lng: center.lng)
    }
    
    func detailCenterName() -> String {
        guard let detail = detail else {
            return ""
        }
        return detail.centerName
    }
    
    func detailFacilityName() -> String {
        guard let detail = detail else {
            return ""
        }
        return detail.facilityName
    }
    
    func detailPhoneNumber() -> String {
        guard let detail = detail else {
            return ""
        }
        return detail.phoneNumber
    }
    
    func detailUpdatedAt() -> String {
        guard let detail = detail else {
            return ""
        }
        return detail.updatedAt
    }
    
    func detailAddress() -> String {
        guard let detail = detail else {
            return ""
        }
        return detail.address
    }
    
    func detailLat() -> String {
        guard let detail = detail else {
            return ""
        }
        return detail.lat
    }
    
    func detailLng() -> String {
        guard let detail = detail else {
            return ""
        }
        return detail.lng
    }
}
