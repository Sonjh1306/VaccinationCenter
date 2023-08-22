//
//  CenterListRepository.swift
//  VaccinationCenter
//
//  Created by sonjuhyeong on 2023/08/22.
//

import Moya
import RxSwift

protocol CenterListRepository {
    func fetchCenterList(perPage: String) -> Observable<CenterList>
}
