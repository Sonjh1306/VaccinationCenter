import UIKit
import SnapKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {

    private var disposebag = DisposeBag()
    
    //MARK: - 헤더 뷰
    var headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        return view
    }()
    
    var headerText: UILabel = {
        let headerText = UILabel()
        headerText.text = "예방접종 센터 리스트"
        headerText.font = UIFont.boldSystemFont(ofSize: 18)
        return headerText
    }()
    
    //MARK: - 센터 정보 테이블 뷰
    var centerTableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    //MARK: - 상위로 스크롤 이동 버튼
    var scrollButton: UIButton = {
        let button = UIButton()
        button.layer.masksToBounds = false
        button.layer.cornerRadius = 20
        button.backgroundColor = .white
        button.setImage(UIImage(named: "top-alignment"), for: .normal)
        button.layer.shadowColor =  UIColor.black.cgColor
        button.layer.shadowRadius = 5
        button.layer.shadowOpacity = 0.3
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCenterTableView()
        configureConstraint()
        configureButton()
    }
    
    //MARK: - CenterTableView 설정
    private func configureCenterTableView() {
        centerTableView.register(CenterTableViewCell.nib, forCellReuseIdentifier: CenterTableViewCell.identifier)
        centerTableView.delegate = self
        centerTableView.dataSource = self
        configureTableViewInset()
    }
    
    private func configureTableViewInset() {
        centerTableView.separatorStyle = .singleLine
        centerTableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    //MARK: - Constraint
    private func configureConstraint() {
        view.addSubview(headerView)
        headerView.addSubview(headerText)
        view.addSubview(centerTableView)
        view.addSubview(scrollButton)
        
        headerView.snp.makeConstraints { headerView in
            headerView.leading.equalToSuperview()
            headerView.top.equalToSuperview()
            headerView.trailing.equalToSuperview()
            headerView.height.equalTo(self.view.frame.height / 8)
        }
        
        headerText.snp.makeConstraints { label in
            label.centerX.equalTo(self.headerView)
            label.bottom.equalTo(self.headerView).offset(-10)
            
        }
        
        centerTableView.snp.makeConstraints { tableView in
            tableView.top.equalTo(self.headerView.snp.bottom)
            tableView.bottom.equalToSuperview()
            tableView.leading.equalToSuperview()
            tableView.trailing.equalToSuperview()
        }
        
        scrollButton.snp.makeConstraints { button in
            button.width.equalTo(40)
            button.height.equalTo(40)
            button.bottom.equalTo(self.view).offset(-50)
            button.trailing.equalTo(self.view).offset(-20)
        }
    }
    
    //MARK: - 상위로 이동 버튼 관련 메소드
    private func configureButton() {
        scrollButton.addTarget(self, action: #selector(scrollButtonAction), for: .touchUpInside)
    }
    
    @objc func scrollButtonAction() {
        centerTableView.setContentOffset(CGPoint(x: 0, y: 0), animated: false)
    }
}

extension UIViewController: UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CenterTableViewCell.identifier, for: indexPath) as? CenterTableViewCell else { return UITableViewCell() }
        
        return cell
    }
    
}
