import Foundation
import RxCocoa
import RxSwift

class CenterListViewModel: ViewModelType {
    
    struct Input {
        let onApear = PublishSubject<Void>()
        let scrollDown = PublishSubject<Int>()
    }
    
    struct Output {
        let centerList = PublishSubject<CenterList>()
    }
    
    var input: Input = Input()
    var output: Output = Output()
    
    var disposeBag: DisposeBag = DisposeBag()
    
    private let useCase: CenterListUseCase
    
    init(useCase: CenterListUseCase) {
        self.useCase = useCase
        
        input.onApear
            .flatMap { _ in self.useCase.excuteFetchingCenterlist(perPage: "10") }
            .bind(to: output.centerList)
            .disposed(by: disposeBag)
        
        input.scrollDown
            .map{ $0 }
            .flatMap{ (perPage) in self.useCase.excuteFetchingCenterlist(perPage: String(perPage))}
            .bind(to: output.centerList)
            .disposed(by: disposeBag)
    }

}
