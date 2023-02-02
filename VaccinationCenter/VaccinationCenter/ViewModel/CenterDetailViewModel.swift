import Foundation
import RxSwift
import RxCocoa

class CenterDetailViewModel: ViewModelType {
    
    struct Input {
        let onLoad = PublishSubject<Center>()
    }
    
    struct Output {
        let centerDetailData = ReplaySubject<CenterDetail>.create(bufferSize: 1)
    }
    
    var input: Input = Input()
    var output: Output = Output()
    
    var disposeBag: DisposeBag = DisposeBag()
    
    init() {
        input.onLoad
            .bind { [weak self] (center) in
                print("2")
                let centerDetail = CenterDetail(centerName: center.centerName,
                                                facilityName: center.facilityName,
                                                phoneNumber: center.phoneNumber,
                                                updatedAt: center.updatedAt,
                                                address: center.address,
                                                lat: center.lat,
                                                lng: center.lng)
                
                self?.output.centerDetailData.onNext(centerDetail)
            }.disposed(by: disposeBag)
    }

}