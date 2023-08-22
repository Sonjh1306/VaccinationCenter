//
//  CenterListTableViewCell.swift
//  VaccinationCenter
//
//  Created by sonjuhyeong on 2023/08/21.
//

import UIKit

class CenterListTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    static var identifier: String {
        String(describing: self)
    }
    
    // Center
    private let centerNameTitleLabel: UILabel = {
        let label = BaseLabel(weight: .regular,
                              fontSize: 14,
                              textColor: .systemGray2,
                              nemberOfLine: 1,
                              textAlignment: .left,
                              text: "센터명")
        return label
    }()
    
    private let centerNameContentLabel: UILabel = {
        let label = BaseLabel(weight: .regular,
                              fontSize: 14,
                              textColor: .black,
                              nemberOfLine: 1,
                              textAlignment: .left,
                              text: "")
        return label
    }()
    
    // Facility
    private let faciliyNameTitleLabel: UILabel = {
        let label = BaseLabel(weight: .regular,
                              fontSize: 14,
                              textColor: .systemGray2,
                              nemberOfLine: 1,
                              textAlignment: .left,
                              text: "건물명")
        return label
    }()
    
    private let faciliyNameContentLabel: UILabel = {
        let label = BaseLabel(weight: .regular,
                              fontSize: 14,
                              textColor: .black,
                              nemberOfLine: 1,
                              textAlignment: .left,
                              text: "")
        return label
    }()
    
    // Address
    private let addressTitleLabel: UILabel = {
        let label = BaseLabel(weight: .regular,
                              fontSize: 14,
                              textColor: .systemGray2,
                              nemberOfLine: 1,
                              textAlignment: .left,
                              text: "주소")
        return label
    }()
    
    private let addressContentLabel: UILabel = {
        let label = BaseLabel(weight: .regular,
                              fontSize: 14,
                              textColor: .black,
                              nemberOfLine: 1,
                              textAlignment: .left,
                              text: "")
        return label
    }()
    
    // UpdateAt
    private let updateAtTitleLabel: UILabel = {
        let label = BaseLabel(weight: .regular,
                              fontSize: 14,
                              textColor: .systemGray2,
                              nemberOfLine: 1,
                              textAlignment: .left,
                              text: "업데이트 시간")
        return label
    }()
    
    private let updateAtContentLabel: UILabel = {
        let label = BaseLabel(weight: .regular,
                              fontSize: 14,
                              textColor: .black,
                              nemberOfLine: 1,
                              textAlignment: .left,
                              text: "")
        return label
    }()

    // MARK: - Initialize
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Method
    private func addSubviews() {
        // Center
        self.addSubview(centerNameTitleLabel)
        self.addSubview(centerNameContentLabel)
        // Facility
        self.addSubview(faciliyNameTitleLabel)
        self.addSubview(faciliyNameContentLabel)
        // Address
        self.addSubview(addressTitleLabel)
        self.addSubview(addressContentLabel)
        // UpdateAt
        self.addSubview(updateAtTitleLabel)
        self.addSubview(updateAtContentLabel)
        
    }
    
    private func setUpViews() {
        addSubviews()
        
        centerNameTitleLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(15)
            $0.width.equalTo(Constants.DEVICE_WIDTH / 3)
        }
        
        centerNameContentLabel.snp.makeConstraints {
            $0.top.trailing.equalToSuperview().inset(15)
            $0.leading.equalTo(centerNameTitleLabel.snp.trailing).offset(15)
        }
        
        faciliyNameTitleLabel.snp.makeConstraints {
            $0.top.equalTo(centerNameTitleLabel.snp.bottom).offset(15)
            $0.leading.equalToSuperview().inset(15)
            $0.width.equalTo(Constants.DEVICE_WIDTH / 3)
        }
        
        faciliyNameContentLabel.snp.makeConstraints {
            $0.top.equalTo(centerNameContentLabel.snp.bottom).offset(15)
            $0.leading.equalTo(faciliyNameTitleLabel.snp.trailing).offset(15)
            $0.trailing.equalToSuperview().inset(15)
        }
        
        addressTitleLabel.snp.makeConstraints {
            $0.top.equalTo(faciliyNameTitleLabel.snp.bottom).offset(15)
            $0.leading.equalToSuperview().inset(15)
            $0.width.equalTo(Constants.DEVICE_WIDTH / 3)
        }
        
        addressContentLabel.snp.makeConstraints {
            $0.top.equalTo(faciliyNameContentLabel.snp.bottom).offset(15)
            $0.leading.equalTo(addressTitleLabel.snp.trailing).offset(15)
            $0.trailing.equalToSuperview().inset(15)
        }
        
        updateAtTitleLabel.snp.makeConstraints {
            $0.top.equalTo(addressTitleLabel.snp.bottom).offset(15)
            $0.leading.equalToSuperview().inset(15)
            $0.width.equalTo(Constants.DEVICE_WIDTH / 3)
            $0.bottom.equalToSuperview().inset(15)
        }
        
        updateAtContentLabel.snp.makeConstraints {
            $0.top.equalTo(addressContentLabel.snp.bottom).offset(15)
            $0.leading.equalTo(updateAtTitleLabel.snp.trailing).offset(15)
            $0.trailing.equalToSuperview().inset(15)
            $0.bottom.equalToSuperview().inset(15)
        }
    }
    
    func configureCell(center: Center) {
        self.centerNameContentLabel.text = center.centerName
        self.faciliyNameContentLabel.text = center.facilityName
        self.addressContentLabel.text = center.address
        self.updateAtContentLabel.text = center.updatedAt
    }
}
