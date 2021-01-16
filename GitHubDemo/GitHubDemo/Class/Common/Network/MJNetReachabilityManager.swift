//
//  MJNetReachabilityManager.swift
//  GitHubDemo
//
//  Created by mac on 2021/1/14.
//

import Foundation
import Alamofire
import Toast_Swift

public enum NetReachabilityStatus: Int  {
    case unknown = -1               /// 未知
    case notReachable = 0           /// 没网
    case reachableViaWiFi = 1       /// WiFi
    case reachableWwan = 2          /// 蜂窝
}

private let instance = MJNetReachabilityManager()

class MJNetReachabilityManager : NSObject {
    
    private var reachabilityStatus : NetReachabilityStatus = .unknown
    
    static var shared: MJNetReachabilityManager {
        ToastManager.shared.isTapToDismissEnabled = true
        return instance
    }

    func startMonitoring() {
        //let reachabilityManager = NetworkReachabilityManager.default
        let reachabilityManager = NetworkReachabilityManager.init()

        reachabilityManager!.startListening { [weak self] status in
            switch status {
            case .notReachable:
                self?.reachabilityStatus = NetReachabilityStatus.notReachable
                self?.showOfflineToast()
                print("当前无网络")
            case .reachable(.ethernetOrWiFi):
                self?.reachabilityStatus = NetReachabilityStatus.reachableViaWiFi
                self?.dismissOfflineToast()
                print("连接类型为WIFI网络")
            case .reachable(.cellular):
                self?.reachabilityStatus = NetReachabilityStatus.reachableWwan
                self?.dismissOfflineToast()
                print("连接类型为蜂窝连接")
            case .unknown:
                self?.reachabilityStatus = NetReachabilityStatus.unknown
                print("Unknown network state")
            }
        }
    }
    
    func netWorkReachability(reachabilityStatus: @escaping(NetReachabilityStatus)->Void){
            let reachabilityManager = NetworkReachabilityManager.init()
        reachabilityManager!.startListening { (status) in
            //wifi
            if status == NetworkReachabilityManager.NetworkReachabilityStatus.reachable(.ethernetOrWiFi){
                print("------WiFi")
                 reachabilityStatus(.reachableViaWiFi)
            }
            //不可用
            if status == NetworkReachabilityManager.NetworkReachabilityStatus.notReachable{
                  print("------没网")
                reachabilityStatus(.notReachable)
            }
            //未知
            if status == NetworkReachabilityManager.NetworkReachabilityStatus.unknown{
                print("------未知")
                reachabilityStatus(.unknown)
            }
            //蜂窝
            if status == NetworkReachabilityManager.NetworkReachabilityStatus.reachable(.cellular){
                 print("------蜂窝")
                reachabilityStatus(.reachableWwan)
            }
        }
    }
    
    func stopMonitoring() {
        let reachabilityManager = NetworkReachabilityManager.default
        reachabilityManager?.stopListening()
    }
    
    func isNetReached() -> Bool {
        let reachabilityManager = NetworkReachabilityManager.default
        let status = reachabilityManager?.status ?? .unknown
        switch status {
        case .notReachable:
            self.reachabilityStatus = NetReachabilityStatus.notReachable
            print("当前无网络")
            return false
        case .reachable(.ethernetOrWiFi):
            self.reachabilityStatus = NetReachabilityStatus.reachableViaWiFi
            print("连接类型为WIFI网络")
            return true
        case .reachable(.cellular):
            self.reachabilityStatus = NetReachabilityStatus.reachableWwan
            print("连接类型为蜂窝连接")
            return true
        case .unknown:
            self.reachabilityStatus = NetReachabilityStatus.unknown
            print("Unknown network state")
            return false
        }
    }
    
    
    func isReachable() -> Bool {
        return true
    }
    
    func showOfflineToast() {
        cr_currentWindow()?.makeToast("网络已断开，请重新连接网络", duration: 3.0, position: .center)
    }
    
    func dismissOfflineToast() {
        cr_currentNavVC()?.view.hideToast()
    }
    
}

