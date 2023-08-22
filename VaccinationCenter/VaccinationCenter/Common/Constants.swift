//
//  Constants.swift
//  VaccinationCenter
//
//  Created by sonjuhyeong on 2023/08/21.
//

import Foundation
import UIKit

struct Constants {
    
    //MARK: - DEVICE
    static let DEVICE_WIDTH: CGFloat = UIScreen.main.bounds.width
    static let DEVICE_HEIGHT: CGFloat = UIScreen.main.bounds.height
    
    // MARK: - URL
    static let BASE_URL: String = "https://api.odcloud.kr"
    static let CENTER_LIST_PATH: String = "api/15077586/v1/centers"
    
    // MARK: - String
    static let CENTER_LIST_HEADERVIEW_TITLE: String = "예방접종 센터 리스트"
    
    // MARK: - IMAGE NAME
    static let TOP_BUTTON_IMAGE_NAME: String = "top-alignment"
}
