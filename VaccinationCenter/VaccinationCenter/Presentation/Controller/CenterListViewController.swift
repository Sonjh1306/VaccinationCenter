import UIKit
import RxCocoa
import RxSwift
import Moya

final class CenterListViewController: BaseViewController {
    
    // MARK: - Properties
    private var disposebag = DisposeBag()
    private var datasource = CenterList(list: [])
    
    private let centerListView = CenterListView()
    private let centerListViewModel = CenterListViewModel(useCase: DefaultCenterListUseCase(centerListRepository: DefaultCenterListRepository(wrapper: .init(plugins: [NetworkLoggerPlugin()]))))
    
    // MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        
        centerListView.centerListTableView.delegate = self
        centerListView.centerListTableView.dataSource = self
        
        setUpViews()
        bind()
    }
    
    //MARK: - Method
    private func addSubviews() {
        self.view.addSubview(centerListView)
    }
    
    private func setUpViews() {
        addSubviews()
    
        centerListView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func bind() {
        // Action -> Input
        centerListViewModel.input.onApear.onNext(())
        
        // Output -> Update
        centerListViewModel.output.centerList
            .bind(onNext: { [weak self] (list) in
                guard let self = self else { return }
                self.datasource = list
                self.centerListView.centerListTableView.reloadData()
            })
            .disposed(by: disposebag)
        
        // Action
        centerListView.topScrollButton.rx.tap
            .bind { [weak self] _ in
                self?.centerListView.centerListTableView.setContentOffset(.zero, animated: false)
            }.disposed(by: disposebag)
        
    }
    
}

extension CenterListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CenterListTableViewCell.identifier, for: indexPath) as? CenterListTableViewCell else { return UITableViewCell() }
        
        let center = datasource.list[indexPath.row]
        cell.configureCell(center: center)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = CenterDetailViewController()
        
        let center = datasource.list[indexPath.row]
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
                let currentListCount = self.datasource.list.count
                self.centerListViewModel.input.scrollDown.onNext(currentListCount + 10)
            })
            
        }
    }
}

