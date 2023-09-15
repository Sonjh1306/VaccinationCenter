import Foundation
import RxSwift
import RxCocoa

class CenterDetailViewModel: ViewModelType {
    
    struct Input {
        let onLoad = PublishSubject<Center>()
    }
    
    struct Output {
        let centerDetailData = ReplaySubject<Center>.create(bufferSize: 1)
    }
    
    var input: Input = Input()
    var output: Output = Output()
    var disposeBag: DisposeBag = DisposeBag()
    
    init() {
        
    }

}
