//
//  CRGlobalFunction.swift
//  GitHubDemo
//
//  Created by mac on 2021/1/16.
//

import Foundation
import UIKit

/// 当前 Window
func cr_currentWindow() -> UIWindow? {
    let keyWindow = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?.windows
            .filter({$0.isKeyWindow}).first
    return keyWindow
}

/// 获取当前的 NavigationController
func cr_currentNavVC() -> UINavigationController? {
    return cr_currentVC()?.navigationController
}


// MARK: LOG
func CRLog(_ message: String) {
    #if DEBUG
    let msgs = ["invalid UToken invalid", "invalid"]
    if msgs.contains(message) == true{
        print("😈 ******** 😈")
    }
    print("\(message)")
    #endif
}
