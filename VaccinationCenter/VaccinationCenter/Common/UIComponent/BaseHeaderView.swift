//
//  BaseHeaderView.swift
//  VaccinationCenter
//
//  Created by sonjuhyeong on 2023/08/21.
//

import UIKit

class BaseHeaderView: UIView {
    
    enum HeaderViewType {
        case backButton
        case backButtonTitle
        case closeButton
        case closeButtonTitle
        case twoButton
        case twoButtonTitle
        case noButtonTitle
    }
    
    // MARK: - Properties
    let backButton: UIButton = {
        let button = UIButton()
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    let closeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Close", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    let headerTitleLabel: BaseLabel = {
        let label = BaseLabel(weight: .medium,
                              fontSize: 18,
                              textColor: .black,
                              nemberOfLine: 0,
                              textAlignment: .center,
                              text: "")
        return label
    }()
    
    
    // MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Method
    private func addSubviews() {
        self.addSubview(backButton)
        self.addSubview(closeButton)
        self.addSubview(headerTitleLabel)
    }
    
    private func setUpViews() {
        addSubviews()
        
        backButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
        }
        
        headerTitleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(Constants.DEVICE_WIDTH)
        }
        
        closeButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(20)
        }
    }
    
    func configureHeaderType(_ type: HeaderViewType,
                             _ title: String? = nil,
                             _ backgroundColor: UIColor? = .white)  {
        self.headerTitleLabel.text = title
        self.backgroundColor = backgroundColor
        
        switch type {
        case .backButton:
            closeButton.isHidden = true
            headerTitleLabel.isHidden = true
        case .backButtonTitle:
            closeButton.isHidden = true
        case .closeButton:
            backButton.isHidden = true
            headerTitleLabel.isHidden = true
        case .closeButtonTitle:
            backButton.isHidden = true
        case .twoButton:
            headerTitleLabel.isHidden = true
        case .twoButtonTitle:
            return
        case .noButtonTitle:
            backButton.isHidden = true
            closeButton.isHidden = true
        }
    }
    
}
