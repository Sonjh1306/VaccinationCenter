//
//  Bundle+Extension.swift
//  VaccinationCenter
//
//  Created by sonjuhyeong on 2023/08/21.
//

import Foundation

extension Bundle {
    private var apiKey: String {
        get {
            guard let filePath = Bundle.main.path(forResource: "SecretKey", ofType: "plist") else {
                fatalError("Couldn't find file 'SecretKey.plist'.")
            }
            
            let plist = NSDictionary(contentsOfFile: filePath)
            guard let value = plist?.object(forKey: "API_KEY") as? String else {
                fatalError("Couldn't find key 'API_KEY' in 'SecretKey.plist'.")
            }
            return value
        }
    }
}
