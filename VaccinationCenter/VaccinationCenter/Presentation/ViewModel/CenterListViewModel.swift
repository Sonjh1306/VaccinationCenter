import Foundation
import RxCocoa
import RxSwift

class CenterListViewModel: ViewModelType {
    
    struct Input {
        let centerListFetchTrigger = PublishSubject<Int>()
    }
    
    struct Output {
        let centerList = PublishRelay<CenterList>()
    }
    
    var input: Input = Input()
    var output: Output = Output()
    var disposeBag: DisposeBag = DisposeBag()
    
    private let useCase: CenterListUseCase
    
    init(useCase: CenterListUseCase) {
        self.useCase = useCase
        
        input.centerListFetchTrigger
            .flatMap { (perPage) in self.useCase.excuteFetchingCenterlist(perPage: String(perPage)) }
            .bind(to: self.output.centerList)
            .disposed(by: disposeBag)
    }

}
