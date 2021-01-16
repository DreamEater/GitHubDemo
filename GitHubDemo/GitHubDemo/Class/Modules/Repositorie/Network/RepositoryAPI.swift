//
//  RepositoryAPI.swift
//  GitHubDemo
//
//  Created by mac on 2021/1/16.
//

import Foundation
import Alamofire

class RepositoryAPI {
    /// 查询仓库列表
    func searchRepositories(query: String, page: Int, completion: @escaping ([Repository]) -> Void) {
        sessionManager.request(MJGitRouter.repository_search_url(query, "\(page)"))
        .responseDecodable(of: Repositories.self) { response in
          guard let items = response.value else {
            return completion([])
          }
          completion(items.items)
        }
    }
    
}
