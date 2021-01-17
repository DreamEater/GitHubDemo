//
//  HomeViewAPI.swift
//  GitHubDemo
//
//  Created by mac on 2021/1/16.
//

import Foundation
import Alamofire
import RxSwift

class HomeViewAPI {
//    var bodyModel = Variable<String?>(nil)
    
    open class var shared: HomeViewAPI { return HomeViewAPI() }
    /// 查询仓库列表
    func requestBaseApi(completion: @escaping (String) -> Void) {
        sessionManager.request(GitHubBaseAPI()).responseString { response in
            guard let jsonStr = response.value else {
              return completion("")
            }
            completion(jsonStr)
        }
    }
}

class GitHubBaseAPI: URLRequestConvertible {
    func asURLRequest() throws -> URLRequest {
        let base_str = "https://api.github.com"
        let url = try base_str.asURL()
        var request = URLRequest(url: url)
        request.method = HTTPMethod.get
        return request
    }
}
