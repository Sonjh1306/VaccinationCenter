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
    static let CENTER_TITLE: String = "센터명"
    static let BUILDING_TITLE: String = "건물명"
    static let TELEPHONE_TITLE: String = "전화번호"
    static let UPDATEAT_TITLE: String = "업데이트 시간"
    static let ADDRESS_TITLE: String = "주소"
    
    
    // MARK: - IMAGE NAME
    static let TOP_BUTTON_IMAGE_NAME: String = "top-alignment"
    static let HOSPITAL_IMAGE_NAME: String = "hospital"
    static let BUILDING_IMAGE_NAME: String = "building"
    static let TELEPHONE_IMAGE_NAME: String = "telephone"
    static let CHAT_IMAGE_NAME: String = "chat"
    static let PLACEHOLDER_IMAGE_NAME: String = "placeholder"
}
