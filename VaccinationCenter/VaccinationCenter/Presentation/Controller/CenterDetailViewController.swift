import UIKit
import RxSwift

class CenterDetailViewController: BaseViewController {
    
    // MARK: - Properties
    private var disposeBag = DisposeBag()
    
    private var centerDetailView = CenterDetailView()
    private var centerDetailViewModel: CenterDetailViewModel!
    
    //MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    //MARK: - Method
    func configureViewModel(_ viewModel: CenterDetailViewModel) {
        self.centerDetailViewModel = viewModel
    }
    
    private func addSubviews() {
        self.view.addSubview(centerDetailView)
    }
    
    private func setUpViews() {
        addSubviews()
        configureRightBarButtonItem()
        
        centerDetailView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func bind() {
        
    }
}

extension CenterDetailViewController {
    
    private func configureRightBarButtonItem() {
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
    
}
