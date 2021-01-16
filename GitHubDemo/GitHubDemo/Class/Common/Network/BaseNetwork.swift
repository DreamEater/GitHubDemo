//
//  BaseNetwork.swift
//  GitHubDemo
//
//  Created by mac on 2021/1/13.
//

import Foundation
import RxSwift
import Moya
import PromiseKit
import SwiftyJSON
import Alamofire

class BaseNetwork {
    static let kBaseURL = "https://api.github.com"
    static var disposeBag = DisposeBag()

    static func request<T : TargetType>(target: T) -> Single<Any>{
        let provider = MoyaProvider<T>()
        return Single<Any>.create {signal -> Disposable in
            //网络请求模块
            provider.rx.request(target).asObservable().subscribe { (event) in
                switch event{
                    case let .next(response)://网络请求成功
                        /*
                        let responseDic = JSON(response.data).dictionaryObject
                       //判断code
                        */
                        signal(.success(response.data))//
                    case let .error(error)://网络请求失败
                        signal(.error(error))
                    case .completed: break//完成
                }
            }.disposed(by: BaseNetwork.disposeBag)
            
            return Disposables.create()
        }
    }
}
