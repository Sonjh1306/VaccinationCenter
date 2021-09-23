import UIKit

class DetailViewController: UIViewController {
    
    let viewModel = DetailViewModel()
    
    //MARK: - View
    var centerNameView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.masksToBounds = false
        view.layer.cornerRadius = 5
        view.layer.shadowRadius = 5
        view.layer.shadowOpacity = 0.3
        return view
    }()

    var facilityNameView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.masksToBounds = false
        view.layer.cornerRadius = 5
        view.layer.shadowRadius = 5
        view.layer.shadowOpacity = 0.3
        return view
    }()

    var phoneNumberView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.masksToBounds = false
        view.layer.cornerRadius = 5
        view.layer.shadowRadius = 5
        view.layer.shadowOpacity = 0.3
        return view
    }()

    var updateAtView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.masksToBounds = false
        view.layer.cornerRadius = 5
        view.layer.shadowRadius = 5
        view.layer.shadowOpacity = 0.3
        return view
    }()

    var addressView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.masksToBounds = false
        view.layer.cornerRadius = 5
        view.layer.shadowRadius = 5
        view.layer.shadowOpacity = 0.3
        return view
    }()

    //MARK: - ImageView
    var centerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "hospital")
        return imageView
    }()

    var facilityImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "building")
        return imageView
    }()

    var phoneNumberImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "telephone")
        return imageView
    }()

    var updateAtImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "chat")
        return imageView
    }()

    var addressImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "placeholder")
        return imageView
    }()

    //MARK: - Label
    var centerNameLabel: UILabel = {
        let label = UILabel()
        label.text = "센터명"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    var facilityNameLabel: UILabel = {
        let label = UILabel()
        label.text = "건물명"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    var phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "전화번호"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    var updateAtLabel: UILabel = {
        let label = UILabel()
        label.text = "업데이트 시간"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    var addressLabel: UILabel = {
        let label = UILabel()
        label.text = "주소"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    var centerInfoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    var facilityInfoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    var phoneNumberInfoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    var updateAtInfoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    var addressInfoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray5
        configureViewConstraint()
        configureImageView()
        rightBarButtonItem()
        configureLabelConstraint()
        configureInformation()
    }
 
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func configureInformation() {
        self.centerInfoLabel.text = viewModel.detailCenterName()
        self.facilityInfoLabel.text = viewModel.detailFacilityName()
        self.phoneNumberInfoLabel.text = viewModel.detailPhoneNumber()
        self.updateAtInfoLabel.text = viewModel.detailUpdatedAt()
        self.addressInfoLabel.text = viewModel.detailAddress()
    }
     
    func rightBarButtonItem() {
        let button = UIButton(type: .system)
        button.setTitle("지도", for: .normal)
        button.addTarget(self, action: #selector(touchedRightBarButton), for: .touchUpInside)
        let selectButton = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = selectButton
    }
    
    @objc func touchedRightBarButton() {
        let mapViewController = MapViewController()
        mapViewController.mapViewModel.setInformation(name:self.viewModel.detailCenterName(),
                                                      lat: self.viewModel.detailLat(),
                                                      lng: self.viewModel.detailLng())
        self.navigationController?.pushViewController(mapViewController, animated: true)
    }
    
    private func configureViewConstraint() {
        view.addSubview(centerNameView)
        view.addSubview(facilityNameView)
        view.addSubview(phoneNumberView)
        view.addSubview(updateAtView)
        view.addSubview(addressView)

        centerNameView.snp.makeConstraints { view in
            view.leading.equalTo(self.view).offset(30)
            view.top.equalTo(self.view.safeAreaLayoutGuide).offset(15)
            view.width.equalTo(self.view.frame.width / 2.5)
            view.height.equalTo(self.view.frame.height / 5)
        }

        facilityNameView.snp.makeConstraints { view in
            view.trailing.equalTo(self.view).offset(-30)
            view.top.equalTo(self.view.safeAreaLayoutGuide).offset(15)
            view.width.equalTo(self.view.frame.width / 2.5)
            view.height.equalTo(self.view.frame.height / 5)
        }

        phoneNumberView.snp.makeConstraints { view in
            view.leading.equalTo(self.view).offset(30)
            view.top.equalTo(self.centerNameView.snp.bottom).offset(30)
            view.width.equalTo(self.view.frame.width / 2.5)
            view.height.equalTo(self.view.frame.height / 5)
        }


        updateAtView.snp.makeConstraints { view in
            view.trailing.equalTo(self.view).offset(-30)
            view.top.equalTo(self.facilityNameView.snp.bottom).offset(30)
            view.width.equalTo(self.view.frame.width / 2.5)
            view.height.equalTo(self.view.frame.height / 5)
        }

        addressView.snp.makeConstraints { view in
            view.leading.equalTo(self.view).offset(30)
            view.trailing.equalTo(self.view).offset(-30)
            view.top.equalTo(self.updateAtView.snp.bottom).offset(30)
            view.height.equalTo(self.view.frame.height / 5)
        }
    }

    private func configureImageView() {
        centerNameView.addSubview(centerImageView)
        facilityNameView.addSubview(facilityImageView)
        phoneNumberView.addSubview(phoneNumberImageView)
        updateAtView.addSubview(updateAtImageView)
        addressView.addSubview(addressImageView)

        centerImageView.snp.makeConstraints { view in
            view.centerX.equalTo(self.centerNameView)
            view.top.equalTo(self.centerNameView.snp.top).offset(20)
            view.width.equalTo(self.view.frame.width / 8)
            view.height.equalTo(self.view.frame.width / 8)
        }
        
        facilityImageView.snp.makeConstraints { view in
            view.centerX.equalTo(self.facilityNameView)
            view.top.equalTo(self.facilityNameView.snp.top).offset(20)
            view.width.equalTo(self.view.frame.width / 8)
            view.height.equalTo(self.view.frame.width / 8)
        }
        
        phoneNumberImageView.snp.makeConstraints { view in
            view.centerX.equalTo(self.phoneNumberView)
            view.top.equalTo(self.phoneNumberView.snp.top).offset(20)
            view.width.equalTo(self.view.frame.width / 8)
            view.height.equalTo(self.view.frame.width / 8)
        }
        
        updateAtImageView.snp.makeConstraints { view in
            view.centerX.equalTo(self.updateAtView)
            view.top.equalTo(self.updateAtView.snp.top).offset(20)
            view.width.equalTo(self.view.frame.width / 8)
            view.height.equalTo(self.view.frame.width / 8)
        }
        
        addressImageView.snp.makeConstraints { view in
            view.centerX.equalTo(self.addressView)
            view.top.equalTo(self.addressView.snp.top).offset(20)
            view.width.equalTo(self.view.frame.width / 8)
            view.height.equalTo(self.view.frame.width / 8)
            
        }

    }
    
    private func configureLabelConstraint() {
        centerNameView.addSubview(centerNameLabel)
        facilityNameView.addSubview(facilityNameLabel)
        phoneNumberView.addSubview(phoneNumberLabel)
        updateAtView.addSubview(updateAtLabel)
        addressView.addSubview(addressLabel)
        centerNameView.addSubview(centerInfoLabel)
        facilityNameView.addSubview(facilityInfoLabel)
        phoneNumberView.addSubview(phoneNumberInfoLabel)
        updateAtView.addSubview(updateAtInfoLabel)
        addressView.addSubview(addressInfoLabel)
        
        centerNameLabel.snp.makeConstraints { label in
            label.leading.equalTo(self.centerNameView.snp.leading).offset(10)
            label.trailing.equalTo(self.centerNameView.snp.trailing).offset(-10)
            label.top.equalTo(self.centerImageView.snp.bottom).offset(10)
        }
        facilityNameLabel.snp.makeConstraints { label in
            label.leading.equalTo(self.facilityNameView.snp.leading).offset(10)
            label.trailing.equalTo(self.facilityNameView.snp.trailing).offset(-10)
            label.top.equalTo(self.facilityImageView.snp.bottom).offset(10)
        }
        phoneNumberLabel.snp.makeConstraints { label in
            label.leading.equalTo(self.phoneNumberView.snp.leading).offset(10)
            label.trailing.equalTo(self.phoneNumberView.snp.trailing).offset(-10)
            label.top.equalTo(self.phoneNumberImageView.snp.bottom).offset(10)
        }
        updateAtLabel.snp.makeConstraints { label in
            label.leading.equalTo(self.updateAtView.snp.leading).offset(10)
            label.trailing.equalTo(self.updateAtView.snp.trailing).offset(-10)
            label.top.equalTo(self.updateAtImageView.snp.bottom).offset(10)
        }
        addressLabel.snp.makeConstraints { label in
            label.leading.equalTo(self.addressView.snp.leading).offset(10)
            label.trailing.equalTo(self.addressView.snp.trailing).offset(-10)
            label.top.equalTo(self.addressImageView.snp.bottom).offset(10)
        }
        centerInfoLabel.snp.makeConstraints { label in
            label.leading.equalTo(self.centerNameView.snp.leading).offset(10)
            label.trailing.equalTo(self.centerNameView.snp.trailing).offset(-10)
            label.top.equalTo(self.centerNameLabel.snp.bottom).offset(10)
            label.bottom.equalTo(self.centerNameView.snp.bottom).offset(-10)
        }
        facilityInfoLabel.snp.makeConstraints { label in
            label.leading.equalTo(self.facilityNameView.snp.leading).offset(10)
            label.trailing.equalTo(self.facilityNameView.snp.trailing).offset(-10)
            label.top.equalTo(self.facilityNameLabel.snp.bottom).offset(10)
            label.bottom.equalTo(self.facilityNameView.snp.bottom).offset(-10)
        }
        phoneNumberInfoLabel.snp.makeConstraints { label in
            label.leading.equalTo(self.phoneNumberView.snp.leading).offset(10)
            label.trailing.equalTo(self.phoneNumberView.snp.trailing).offset(-10)
            label.top.equalTo(self.phoneNumberLabel.snp.bottom).offset(10)
            label.bottom.equalTo(self.phoneNumberView.snp.bottom).offset(-10)
        }
        updateAtInfoLabel.snp.makeConstraints { label in
            label.leading.equalTo(self.updateAtView.snp.leading).offset(10)
            label.trailing.equalTo(self.updateAtView.snp.trailing).offset(-10)
            label.top.equalTo(self.updateAtLabel.snp.bottom).offset(10)
            label.bottom.equalTo(self.updateAtView.snp.bottom).offset(-10)
        }
        addressInfoLabel.snp.makeConstraints { label in
            label.leading.equalTo(self.addressView.snp.leading).offset(10)
            label.trailing.equalTo(self.addressView.snp.trailing).offset(-10)
            label.top.equalTo(self.addressLabel.snp.bottom).offset(10)
            label.bottom.equalTo(self.addressView.snp.bottom).offset(-10)
        }
    }
}
