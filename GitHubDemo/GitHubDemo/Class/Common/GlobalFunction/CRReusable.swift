//
//  CRReusable.swift
//  GitHubDemo
//
//  Created by mac on 2021/1/16.
//

import Foundation
import UIKit

/// 可复用协议
protocol CRReusable: class {
  /// 复用的identifier
  static var cr_identifier: String { get }
}

// MARK: - 设置 UIView 的默认可复用实现
extension CRReusable where Self: UIView {
  static var cr_identifier: String {
    return NSStringFromClass(self)
  }
}

extension CRReusable where Self: UIViewController {
  static var cr_identifier: String {
    let className = NSStringFromClass(self) as NSString
    return className.components(separatedBy: ".").last!
  }
}

// MARK: - 让 UITableViewCell 具有可以复用
extension UITableViewCell: CRReusable {}


