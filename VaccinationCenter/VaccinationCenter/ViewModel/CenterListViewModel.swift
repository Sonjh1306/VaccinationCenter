import Foundation
import RxCocoa
import RxSwift

class CenterListViewModel {
    
    private let useCase: CenterListUseCaseProtocol
    private var centers: BehaviorSubject<[Center]>
    
    init() {
        self.useCase = CenterListUseCase()
        self.centers = BehaviorSubject<[Center]>(value: [])
    }

    func fetch(perPage: String) -> Observable<[Center]> {
        return useCase.fetchCenterList(perPage)
    }
    
    func configureCenters(_ centers: [Center])  {
        self.centers.onNext(centers)
    }
    
    func centersCount() -> Int? {
        do {
            return try self.centers.value().count
        } catch {
           return nil
        }
    }
    
    func center(indexPath: IndexPath) -> Center? {
        do {
            return try centers.value()[indexPath.row]
        } catch {
           return nil
        }
    }
    
    func centersRelay() -> BehaviorSubject<[Center]> {
        return self.centers
    }
}
