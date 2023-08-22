//
//  DefaultCenterListRepository.swift
//  VaccinationCenter
//
//  Created by sonjuhyeong on 2023/08/22.
//

import RxCocoa
import RxSwift
import Moya

class DefaultCenterListRepository: CenterListRepository {
    
    private let wrapper: NetworkWrapper<CenterListTargetType>
    
    init(wrapper: NetworkWrapper<CenterListTargetType>) {
        self.wrapper = wrapper
    }
    
    func fetchCenterList(perPage: String) -> Observable<CenterList> {
        return Observable.create { (observer) -> Disposable in
            self.wrapper.request(target: .getCenterList(perPage),
                                 decodingType: CenterListDTO.self) { (result) in
                switch result {
                case .success(let response):
                    let centerList = response.toDomain()
                    observer.onNext(centerList)
                case .failure(let error):
                    observer.onError(error)
                }
            }
            return Disposables.create()
        }
    }
}
