import Foundation
import RxCocoa
import RxSwift

protocol CenterListServiceProtocol {
    func fetchCenterList(_ page: String) -> Observable<[Center]>
}

class CenterListService: CenterListServiceProtocol {
    
    var networkManager: NetworkManager
    
    init() {
        self.networkManager = NetworkManager()
    }
   
    func fetchCenterList(_ perPage: String) -> Observable<[Center]> {
        return Observable.create { (observer) -> Disposable in
            self.networkManager.sendRequest(perPage: perPage, type: CenterResponse.self) { (error, centerList) in
                if let error = error {
                    observer.onError(error)
                }
                if let centerList = centerList?.data {
                    observer.onNext(centerList)
                }
                observer.onCompleted()
            }
            return Disposables.create()
        }
    }

}
