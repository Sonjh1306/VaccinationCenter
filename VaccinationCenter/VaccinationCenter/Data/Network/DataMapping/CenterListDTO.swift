//
//  CenterListDTO.swift
//  VaccinationCenter
//
//  Created by sonjuhyeong on 2023/08/22.
//

import Foundation

struct CenterListDTO: Codable {
    let currentCount: Int
    let data: [CenterDTO]
}

struct CenterDTO: Codable {
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

extension CenterListDTO {
    func toDomain() -> CenterList {
        var list: [Center] = []
        
        data.forEach { (data) in
            let center = data.toDomain()
            list.append(center)
        }
        
        return CenterList(list: list)
    }
}

extension CenterDTO {
    func toDomain() -> Center {
        let center = Center(centerName: self.centerName,
                            facilityName: self.facilityName,
                            phoneNumber: self.phoneNumber,
                            updatedAt: self.updatedAt,
                            address: self.address,
                            lat: self.lat,
                            lng: self.lng)
        return center
    }
}
