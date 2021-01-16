//
//  UIViewController+Extension.swift
//  GitHubDemo
//
//  Created by mac on 2021/1/16.
//

import Foundation
import UIKit
    
/// 获取当前的 ViewController
func cr_currentVC() -> UIViewController? {
    
    var keyWindow = UIApplication.shared.keyWindow
    if keyWindow?.windowLevel != UIWindow.Level.normal{
      let windows = UIApplication.shared.windows
      for  windowTemp in windows{
        if windowTemp.windowLevel == UIWindow.Level.normal{
            keyWindow = windowTemp
           break
         }
       }
     }
    let vc = keyWindow?.rootViewController
    return cr_findBest(vc)
}


/// 递归查询当前最上面的视图
func cr_findBest(_ vc :UIViewController?) -> UIViewController? {
   if vc == nil {
      return nil
   }
    
   if let presentVC = vc?.presentedViewController {
      return cr_findBest(presentVC)
   }
   else if let naiVC = vc as? UINavigationController {
      return cr_findBest(naiVC.visibleViewController)
   }
   else if let tabVC = vc as? UITabBarController {
      if let selectVC = tabVC.selectedViewController {
          return cr_findBest(selectVC)
       }
       return nil
   }
   else {
       return vc
    }
 }
    
