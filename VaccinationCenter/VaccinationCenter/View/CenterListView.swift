//
//  CenterListView.swift
//  VaccinationCenter
//
//  Created by sonjuhyeong on 2023/02/01.
//

import UIKit

final class CenterListView: UIView {
    
    let headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        return view
    }()
    
    let headerTitleLabel: UILabel = {
        let headerText = UILabel()
        headerText.text = "예방접종 센터 리스트"
        headerText.font = UIFont.boldSystemFont(ofSize: 18)
        return headerText
    }()
    
    let centerTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.register(CenterTableViewCell.nib, forCellReuseIdentifier: CenterTableViewCell.identifier)
        return tableView
    }()
    
    let topScrollButton: UIButton = {
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

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setAddsubviews() {
        self.addSubview(headerView)
        self.addSubview(centerTableView)
        self.addSubview(topScrollButton)
        
        headerView.addSubview(headerTitleLabel)
    }
    
    private func configureConstraints() {

        setAddsubviews()
        
        headerView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(30)
        }
        
        headerTitleLabel.snp.makeConstraints {
            $0.center.equalTo(self.headerView)
        }
        
        centerTableView.snp.makeConstraints {
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
