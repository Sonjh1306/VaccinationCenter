import Foundation
import RxCocoa
import RxSwift
import Moya

protocol CenterListUseCase {
    func excuteFetchingCenterlist(perPage: String) -> Observable<CenterList>
}

final class DefaultCenterListUseCase: CenterListUseCase {

    private let centerListRepository: CenterListRepository
    
    init(centerListRepository: CenterListRepository) {
        self.centerListRepository = centerListRepository
    }

    func excuteFetchingCenterlist(perPage: String) -> Observable<CenterList> {
        return centerListRepository.fetchCenterList(perPage: perPage)
    }
}
