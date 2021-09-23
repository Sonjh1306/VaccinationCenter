import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate {

    private var locationManager: CLLocationManager = CLLocationManager()
    private var currentLocation: CLLocation!
    var mapViewModel = MapViewModel()
    
    var mapView = MKMapView()
    
    var currentLocationButton: UIButton = {
        let button = UIButton()
        button.layer.masksToBounds = false
        button.layer.cornerRadius = 10
        button.setTitle("현재위치로", for: .normal)
        button.backgroundColor = .systemBlue
        return button
    }()
    
    var vaccinationCenterButton: UIButton = {
        let button = UIButton()
        button.layer.masksToBounds = false
        button.layer.cornerRadius = 10
        button.setTitle("접종센터로", for: .normal)
        button.backgroundColor = .systemRed
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLocationManger()
        configureViewConstraint()
        configureButtonAction()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "지도"
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
 
    func configureLocationManger() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.startMonitoringSignificantLocationChanges()
        self.currentLocation = locationManager.location
    }
    
    func configureViewConstraint() {
        view.addSubview(mapView)
        view.addSubview(currentLocationButton)
        view.addSubview(vaccinationCenterButton)
        
        mapView.snp.makeConstraints { view in
            view.top.equalToSuperview()
            view.bottom.equalToSuperview()
            view.leading.equalToSuperview()
            view.trailing.equalToSuperview()
        }
        
        currentLocationButton.snp.makeConstraints { button in
            button.height.equalTo(50)
            button.leading.equalTo(self.mapView.snp.leading).offset(10)
            button.trailing.equalTo(self.mapView.snp.trailing).offset(-10)
            button.bottom.equalTo(self.vaccinationCenterButton.snp.top).offset(-20)
        }
        
        vaccinationCenterButton.snp.makeConstraints { button in
            button.height.equalTo(50)
            button.leading.equalTo(self.mapView.snp.leading).offset(10)
            button.trailing.equalTo(self.mapView.snp.trailing).offset(-10)
            button.bottom.equalTo(self.mapView.snp.bottom).offset(-80)
        }
    }
    
    func configureButtonAction() {
        self.currentLocationButton.addTarget(self, action: #selector(touchedCurrentLocation), for: .touchUpInside)
        self.vaccinationCenterButton.addTarget(self, action: #selector(touchedVaccinationCenter), for: .touchUpInside)
    }
    
    @objc func touchedCurrentLocation() {
        self.mapView.showsUserLocation = true
        self.mapView.setUserTrackingMode(.follow, animated: true)
    }
    
    @objc func touchedVaccinationCenter() {
        guard let annotation = mapViewModel.annotation(), let region = mapViewModel.region() else {
            return
        }
        self.mapView.setRegion(region, animated: true)
        mapView.addAnnotation(annotation)
    }
}
