//
//  CenterDetailView.swift
//  VaccinationCenter
//
//  Created by sonjuhyeong on 2023/02/02.
//

import UIKit

class CenterDetailView: UIView {
    
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

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    convenience init(centerContent: String,
                     facilityContent: String,
                     phoneContent: String,
                     updateAtContent: String,
                     addressContent: String) {
        self.init()
        self.centerView.contentLabel.text = centerContent
        self.facilityView.contentLabel.text = facilityContent
        self.phoneView.contentLabel.text = phoneContent
        self.updateAtView.contentLabel.text = updateAtContent
        self.addressView.contentLabel.text = addressContent
    }
    
    private func setAddsubviews() {
        self.addSubview(centerView)
        self.addSubview(facilityView)
        self.addSubview(phoneView)
        self.addSubview(updateAtView)
        self.addSubview(addressView)
    }
    
    private func configureConstraints() {

        setAddsubviews()
        
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
    
}
