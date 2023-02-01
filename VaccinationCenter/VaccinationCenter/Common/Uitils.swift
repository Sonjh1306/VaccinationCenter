//
//  Utils.swift
//  VaccinationCenter
//
//  Created by sonjuhyeong on 2023/02/01.
//

import UIKit

struct Utils {
    
    static func topViewController() -> UIViewController? {
        
        if let keyWindow = UIApplication.shared.keyWindow {
            if var viewController = keyWindow.rootViewController {
                
                while viewController.presentedViewController != nil {
                    viewController = viewController.presentedViewController!
                }
                
                print("topViewController -> \(String(describing: viewController))")
                
                return viewController
            }
        }
        return nil
    }
    
    static func createAlertMessage(vc: UIViewController, title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        vc.present(alert, animated: true)
    }
}
 
