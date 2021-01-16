//
//  MJGitRouter.swift
//  GitHubDemo
//
//  Created by mac on 2021/1/16.
//

import Foundation
import Alamofire

enum MJGitRouter {
    case emojis_url
    case user_url(String)
    case repository_search_url(_ query: String, _ page: String )
    
    var baseURL: String {
        return "https://api.github.com"
    }
        
    var path: String {
      switch self {
      case .emojis_url:
        return "/emojis"
      case .user_url(let user):
        return "/users/\(user)"
      case .repository_search_url:
        return "/search/repositories"
      }
    }
    
    var method: HTTPMethod {
      switch self {
      case .emojis_url:
        return .get
      case .user_url:
        return .get
      case .repository_search_url:
        return .get
      }
    }
    
    var parameters: [String: String]? {
      switch self {
      case .emojis_url:
        return nil
      case .user_url:
        return nil
      case .repository_search_url(let query ,let page):
        let intPage = Int(page) ?? 0
        if intPage < 1 {
            return ["sort": "stars", "order": "desc", "page": page, "q": "1"]
        } else {
            return ["sort": "stars", "order": "desc", "page": page, "q": query]
        }
      }
    }
}


extension MJGitRouter: URLRequestConvertible {
    func asURLRequest() throws -> URLRequest {
        let url = try baseURL.asURL().appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.method = method
        
        if method == .get {
          request = try URLEncodedFormParameterEncoder()
            .encode(parameters, into: request)
        } else if method == .post {
          request = try JSONParameterEncoder().encode(parameters, into: request)
          request.setValue("application/json", forHTTPHeaderField: "Accept")
        }
        return request
    }
}
