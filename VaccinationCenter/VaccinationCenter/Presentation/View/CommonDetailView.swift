//
//  CommonDetailView.swift
//  VaccinationCenter
//
//  Created by sonjuhyeong on 2023/02/02.
//

import UIKit

final class CommonDetailView: UIView {
    
    enum presentType {
        case center
        case facility
        case phone
        case updateAt
        case address
    }
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    let contentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        configureInitialSetting()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    convenience init(type: presentType) {
        self.init()
        switch type {
        case .center:
            self.logoImageView.image = UIImage(named: "hospital")
            self.titleLabel.text = "센터명"
        case .facility:
            self.logoImageView.image = UIImage(named: "building")
            self.titleLabel.text = "건물명"
        case .phone:
            self.logoImageView.image = UIImage(named: "telephone")
            self.titleLabel.text = "전화번호"
        case .updateAt:
            self.logoImageView.image = UIImage(named: "chat")
            self.titleLabel.text = "업데이트 시간"
        case .address:
            self.logoImageView.image = UIImage(named: "placeholder")
            self.titleLabel.text = "주소"
        }
    }
    
    private func configureInitialSetting() {
        self.backgroundColor = .white
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 5
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.3
        
        configureConstraints()
    }
    
    private func setAddsubviews() {
        self.addSubview(logoImageView)
        self.addSubview(titleLabel)
        self.addSubview(contentLabel)
    }
    
    private func configureConstraints() {
        setAddsubviews()
        
        logoImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(20)
            $0.size.equalTo(50)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(10)
        }
        
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(10)
        }
    }
}
