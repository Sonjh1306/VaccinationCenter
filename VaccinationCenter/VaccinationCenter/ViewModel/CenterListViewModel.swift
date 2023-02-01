import Foundation
import RxCocoa
import RxSwift

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    var input: Input { get }
    var output: Output { get }
    var disposeBag: DisposeBag { get set }
}

final class CenterListViewModel: ViewModelType {
    
    struct Input {
        let onApear = PublishSubject<Void>()
        let scrollDown = PublishSubject<Int>()
    }
    
    struct Output {
        let centers = PublishSubject<[Center]>()
    }
    
    var input: Input = Input()
    var output: Output = Output()
    
    var disposeBag: DisposeBag = DisposeBag()
    
    private let useCase: CenterListUseCase
    
    init(useCase: CenterListUseCase) {
        self.useCase = useCase
        
        input.onApear
            .flatMap { _ in self.useCase.fetchCenterList("10") }
            .bind(to: output.centers)
            .disposed(by: disposeBag)
        
        input.scrollDown
            .map{ $0 }
            .flatMap{ (perPage) in self.useCase.fetchCenterList(String(perPage))}
            .bind(to: output.centers)
            .disposed(by: disposeBag)
    }

}
