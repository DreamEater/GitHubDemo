//
//  NetReachabilityManager.swift
//  GitHubDemo
//
//  Created by mac on 2021/1/14.
//

import Foundation
import Alamofire

public enum NetReachabilityStatus: Int  {
    case unknown = -1
    case notReachable = 0
    case reachableViaWiFi = 1
    case reachableViaCellular = 2
}

class MJNetReachabilityManager : NSObject {
    private var reachabilityStatus : NetReachabilityStatus = .unknown

    //private let reachabilityManager = NetworkReachabilityManager(host: "www.google.com")
    func startMonitoring() {
     let reachabilityManager = NetworkReachabilityManager.default
        reachabilityManager?.startListening { [weak self] status in
            switch status {
            case .notReachable:
                self?.reachabilityStatus = NetReachabilityStatus.notReachable
                self?.showOfflineAlert()
                print("当前无网络")
            case .reachable(.ethernetOrWiFi):
                self?.reachabilityStatus = NetReachabilityStatus.reachableViaWiFi
                self?.dismissOfflineAlert()
                print("连接类型为WIFI网络")
            case .reachable(.cellular):
                self?.reachabilityStatus = NetReachabilityStatus.reachableViaCellular
                self?.dismissOfflineAlert()
                print("连接类型为蜂窝连接")
            case .unknown:
                self?.reachabilityStatus = NetReachabilityStatus.unknown
                print("Unknown network state")
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
            self.reachabilityStatus = NetReachabilityStatus.reachableViaCellular
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
    
    private func showOfflineAlert() {
        
    }
    
    private func dismissOfflineAlert() {
        
    }

    
}
