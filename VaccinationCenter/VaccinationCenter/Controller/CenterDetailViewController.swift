import UIKit

class CenterDetailViewController: UIViewController {
    
    let viewModel = CenterDetailViewModel()
    private var centerDetailView = CenterDetailView()
   

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray6
        rightBarButtonItem()
        configureInformation()
        configureConstraints()
    }
 
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func configureInformation() {
        let centerName = viewModel.detailCenterName()
        let facilityName = viewModel.detailFacilityName()
        let phoneNumber = viewModel.detailPhoneNumber()
        let updateTime = viewModel.detailUpdatedAt()
        let detailAddress = viewModel.detailAddress()
        
        self.centerDetailView = CenterDetailView(centerContent: centerName,
                                                 facilityContent: facilityName,
                                                 phoneContent: phoneNumber,
                                                 updateAtContent: updateTime,
                                                 addressContent: detailAddress)
    }
     
    func rightBarButtonItem() {
        let button = UIButton(type: .system)
        button.setTitle("지도", for: .normal)
        button.addTarget(self, action: #selector(touchedRightBarButton), for: .touchUpInside)
        let selectButton = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = selectButton
    }
    
    @objc func touchedRightBarButton() {
        let mapViewController = CenterLocationViewController()
        mapViewController.mapViewModel.setInformation(name:self.viewModel.detailCenterName(),
                                                      lat: self.viewModel.detailLat(),
                                                      lng: self.viewModel.detailLng())
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
