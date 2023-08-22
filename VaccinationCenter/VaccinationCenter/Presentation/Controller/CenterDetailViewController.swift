import UIKit
import RxSwift

class CenterDetailViewController: BaseViewController {
    
    let viewModel = CenterDetailViewModel()
    private lazy var centerDetailView = CenterDetailView()
    private var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray
        rightBarButtonItem()
        configureConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        bind()
    }
    
//    func bind() {
//        // Output -> Update
//        viewModel.output.centerDetailData
//            .bind { [weak self] (detailData) in
//                self?.centerDetailView.configureData(center: detailData.centerName,
//                                                     facility: detailData.facilityName,
//                                                     phone: detailData.phoneNumber,
//                                                     update: detailData.updatedAt,
//                                                     address: detailData.address)
//            }.disposed(by: disposeBag)
//    }

     
    func rightBarButtonItem() {
        let button = UIButton(type: .system)
        button.setTitle("지도", for: .normal)
        button.addTarget(self, action: #selector(touchedRightBarButton), for: .touchUpInside)
        let selectButton = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = selectButton
    }
    
    @objc func touchedRightBarButton() {
        let mapViewController = CenterLocationViewController()
        self.navigationController?.pushViewController(mapViewController, animated: true)
    }
    
    private func setAddsubviews() {
        self.view.addSubview(centerDetailView)
    }
    
    private func configureConstraints() {
        setAddsubviews()
        
        centerDetailView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
