//
//  CenterDetailUseCase.swift
//  VaccinationCenter
//
//  Created by sonjuhyeong on 2023/09/15.
//

import Foundation
import RxSwift

protocol CenterDetailUseCase {
    func createCenterDetail(with center: Center) -> Observable<CenterDetail>
}

final class DefaultCenterDetailUseCase: CenterDetailUseCase {

    private let center: Center
    
    init(center: Center) {
        self.center = center
    }

    func createCenterDetail(with center: Center) -> Observable<CenterDetail> {
        return Observable.create { (observer) in
            let centerDetail = CenterDetail(centerName: center.centerName,
                                            facilityName: center.facilityName,
                                            phoneNumber: center.phoneNumber,
                                            updatedAt: center.updatedAt,
                                            address: center.address)
            observer.onNext(centerDetail)
            return Disposables.create()
        }
    }
}
