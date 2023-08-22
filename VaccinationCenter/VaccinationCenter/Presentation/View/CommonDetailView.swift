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
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let titleLabel: BaseLabel = {
        let label = BaseLabel(weight: .bold,
                              fontSize: 15,
                              textColor: .black,
                              nemberOfLine: 1,
                              textAlignment: .center,
                              text: "")
        return label
    }()
    
    private let contentLabel: UILabel = {
        let label = BaseLabel(weight: .regular,
                              fontSize: 12,
                              textColor: .black,
                              nemberOfLine: 0,
                              textAlignment: .center,
                              text: "")
        return label
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        
        self.backgroundColor = .white
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 5
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.3
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    convenience init(type: presentType) {
        self.init()
        switch type {
        case .center:
            self.logoImageView.image = UIImage(named: Constants.HOSPITAL_IMAGE_NAME)
            self.titleLabel.text = Constants.CENTER_TITLE
        case .facility:
            self.logoImageView.image = UIImage(named: Constants.BUILDING_IMAGE_NAME)
            self.titleLabel.text = Constants.BUILDING_TITLE
        case .phone:
            self.logoImageView.image = UIImage(named: Constants.TELEPHONE_IMAGE_NAME)
            self.titleLabel.text = Constants.TELEPHONE_TITLE
        case .updateAt:
            self.logoImageView.image = UIImage(named: Constants.CHAT_IMAGE_NAME)
            self.titleLabel.text = Constants.UPDATEAT_TITLE
        case .address:
            self.logoImageView.image = UIImage(named: Constants.PLACEHOLDER_IMAGE_NAME)
            self.titleLabel.text = Constants.ADDRESS_TITLE
        }
    }
    
    private func addSubviews() {
        self.addSubview(logoImageView)
        self.addSubview(titleLabel)
        self.addSubview(contentLabel)
    }
    
    private func setUpViews() {
        addSubviews()
        
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
    
    func configureContentLabel(text: String) {
        self.contentLabel.text = text
    }
}
