import Foundation
import RxCocoa
import RxSwift
import Moya

final class CenterListUseCase {
    
    let provider: MoyaProvider<CenterListAPI>
    
    init(provider: MoyaProvider<CenterListAPI>) {
        self.provider = provider
    }
    
    func fetchCenterList(_ perPage: String) -> Observable<[Center]> {
        return Observable.create { (observer) -> Disposable in
            self.provider.request(.getCenterList(perPage)) { result in
                switch result {
                case .success(let response):
                    do {
                        let decodingData = try response.map(CenterResponse.self).data
                        observer.onNext(decodingData)
                    } catch {
                        observer.onError(error)
                    }
                case .failure(let error):
                    observer.onError(error)
                }
                observer.onCompleted()
            }
            return Disposables.create()
        }
    }

}
