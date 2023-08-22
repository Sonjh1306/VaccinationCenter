//
//  CenterDetailView.swift
//  VaccinationCenter
//
//  Created by sonjuhyeong on 2023/02/02.
//

import UIKit

class CenterDetailView: UIView {
    
    // MARK: - Properties
    private var centerView: CommonDetailView = {
        let centerView = CommonDetailView(type: .center)
        return centerView
    }()
    
    private var facilityView: CommonDetailView = {
        let facilityView = CommonDetailView(type: .facility)
        return facilityView
    }()
    
    private var phoneView: CommonDetailView = {
        let phoneView = CommonDetailView(type: .phone)
        return phoneView
    }()
    
    private var updateAtView: CommonDetailView = {
        let updateAtView = CommonDetailView(type: .updateAt)
        return updateAtView
    }()
    
    private var addressView: CommonDetailView = {
        let addressView = CommonDetailView(type: .address)
        return addressView
    }()

    // MARK: - Override
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Method
    private func addSubviews() {
        self.addSubview(centerView)
        self.addSubview(facilityView)
        self.addSubview(phoneView)
        self.addSubview(updateAtView)
        self.addSubview(addressView)
    }
    
    private func setUpViews() {

        addSubviews()
        
        centerView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(30)
            $0.leading.equalToSuperview().inset(30)
            $0.size.equalTo(150)
        }
        
        facilityView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(30)
            $0.trailing.equalToSuperview().inset(30)
            $0.size.equalTo(150)
        }
        
        phoneView.snp.makeConstraints {
            $0.top.equalTo(centerView.snp.bottom).offset(30)
            $0.leading.equalToSuperview().inset(30)
            $0.size.equalTo(150)
        }
        
        updateAtView.snp.makeConstraints {
            $0.top.equalTo(facilityView.snp.bottom).offset(30)
            $0.trailing.equalToSuperview().inset(30)
            $0.size.equalTo(150)
        }
        
        addressView.snp.makeConstraints {
            $0.top.equalTo(phoneView.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(150)
        }
    }
    
    func configureData(center: String, facility: String, phone: String, update: String, address: String) {
        self.centerView.configureContentLabel(text: center)
        self.facilityView.configureContentLabel(text: facility)
        self.phoneView.configureContentLabel(text: phone)
        self.updateAtView.configureContentLabel(text: update)
        self.addressView.configureContentLabel(text: address)
    }
    
}
