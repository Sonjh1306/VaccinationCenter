import UIKit
import SnapKit
import RxCocoa
import RxSwift
import Moya

final class CenterListViewController: UIViewController {
    
    // MARK: - Properties
    private var disposebag = DisposeBag()
    private var datasource = [Center]()
    
    private let centerListView = CenterListView()
    private let centerListViewModel = CenterListViewModel(useCase: CenterListUseCase(provider: MoyaProvider<CenterListAPI>()))
    
    // MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureInitialSetting()
        bind()
    }

    //MARK: - Method
    private func bind() {
        // Action -> Input
        centerListViewModel.input.onApear.onNext(())
        
        // Output -> Update
        centerListViewModel.output.centers
            .bind(onNext: { [weak self] (list) in
                self?.datasource = list
                self?.centerListView.centerTableView.reloadData()
            })
            .disposed(by: disposebag)
        
        // Action
        centerListView.topScrollButton.rx.tap
            .bind { [weak self] _ in
                self?.centerListView.centerTableView.setContentOffset(CGPoint(x: 0, y: 0), animated: false)
            }.disposed(by: disposebag)
        
    }
    
    private func configureInitialSetting() {
        self.view.backgroundColor = .systemGray
        
        navigationController?.isNavigationBarHidden = true
        
        centerListView.centerTableView.delegate = self
        centerListView.centerTableView.dataSource = self
        
        configureConstraints()
    }
    
    private func setAddsubviews() {
        self.view.addSubview(centerListView)
    }
    
    private func configureConstraints() {
        setAddsubviews()
        
        centerListView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
}

extension CenterListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CenterTableViewCell.identifier, for: indexPath) as? CenterTableViewCell else { return UITableViewCell() }
        
        let center = datasource[indexPath.row]
        cell.configureCell(center: center)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = CenterDetailViewController()
        
        let center = datasource[indexPath.row]
        detailViewController.viewModel.input.onLoad.onNext(center)
        
        detailViewController.navigationItem.title = center.centerName
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.height
        if offsetY > (contentHeight - height) {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                let currentListCount = self.datasource.count
                self.centerListViewModel.input.scrollDown.onNext(currentListCount + 10)
            })
            
        }
    }
}

