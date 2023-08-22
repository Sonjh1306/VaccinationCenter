import UIKit
import RxCocoa
import RxSwift
import Moya

final class CenterListViewController: BaseViewController {
    
    // MARK: - Properties
    private var disposebag = DisposeBag()
    private var datasource = CenterList(list: [])
    
    private let centerListView = CenterListView()
    private var centerListViewModel: CenterListViewModel
    
    init(viewModel: CenterListViewModel) {
        self.centerListViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
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
        centerListViewModel.input.centerListFetchTrigger.onNext(10)
        
        centerListViewModel.output.centerList
            .bind { [weak self] (centerList) in
                guard let self = self else { return }
                self.datasource = centerList
                  self.centerListView.centerListTableView.reloadData()
            }.disposed(by: disposebag)
        
        // Action
        centerListView.topScrollButton.rx.tap
            .bind { [weak self] _ in
                guard let self = self else { return }
                self.centerListView.centerListTableView.setContentOffset(.zero, animated: false)
            }.disposed(by: disposebag)
        
        centerListView.centerListTableView.rx.contentOffset
            .flatMap { (point) in
                return Observable.just(point == .zero ? true: false)
            }
            .bind(to: self.centerListView.topScrollButton.rx.isHidden)
            .disposed(by: disposebag)
        
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
        
        let contentOffsetY = scrollView.contentOffset.y
        let tableViewContentSize = self.centerListView.centerListTableView.contentSize.height
        let paginationY = tableViewContentSize * 0.5
        
        if contentOffsetY > tableViewContentSize - paginationY {
            let currentListCount = self.datasource.list.count
            print(currentListCount)
            self.centerListViewModel.input.centerListFetchTrigger.onNext(currentListCount + 10)
        }
    }
}

