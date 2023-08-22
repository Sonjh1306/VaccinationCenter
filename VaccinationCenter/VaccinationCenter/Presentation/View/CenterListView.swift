//
//  CenterListView.swift
//  VaccinationCenter
//
//  Created by sonjuhyeong on 2023/02/01.
//

import UIKit

final class CenterListView: UIView {

    // MARK: - Properties
    let headerView: BaseHeaderView = {
        let view = BaseHeaderView()
        view.configureHeaderType(.noButtonTitle,
                                 Constants.CENTER_LIST_HEADERVIEW_TITLE,
                                 .systemGray5)
        return view
    }()
    
    let centerListTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

        tableView.register(CenterListTableViewCell.self, forCellReuseIdentifier: CenterListTableViewCell.identifier)
        return tableView
    }()
    
    let topScrollButton: UIButton = {
        let button = UIButton()
        button.layer.masksToBounds = false
        button.layer.cornerRadius = 20
        button.backgroundColor = .white
        button.setImage(UIImage(named: Constants.TOP_BUTTON_IMAGE_NAME), for: .normal)
        button.layer.shadowColor =  UIColor.black.cgColor
        button.layer.shadowRadius = 5
        button.layer.shadowOpacity = 0.3
        return button
    }()

    // MARK: - Override
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Method
    private func setAddsubviews() {
        self.addSubview(headerView)
        self.addSubview(centerListTableView)
        self.addSubview(topScrollButton)
    }
    
    private func configureConstraints() {

        setAddsubviews()
        
        headerView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(70)
        }

        centerListTableView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        topScrollButton.snp.makeConstraints {
            $0.size.equalTo(40)
            $0.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(50)
        }
    }
    
}
