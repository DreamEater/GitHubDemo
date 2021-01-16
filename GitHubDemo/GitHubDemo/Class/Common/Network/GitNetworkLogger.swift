//
//  GitNetworkLogger.swift
//  GitHubDemo
//
//  Created by mac on 2021/1/16.
//

import Foundation
import Alamofire

class GitNetworkLogger: EventMonitor {
  //1 使用一个新的 queue 来记录, EventMonitor 默认使用 main queue
  let queue = DispatchQueue(label: "com.GitHubDemo.networklogger")
  //2
  func requestDidFinish(_ request: Request) {
    print(request.description)
  }
  //3
  func request<Value>(
    _ request: DataRequest,
    didParseResponse response: DataResponse<Value, AFError>
  ) {
    guard let data = response.data else {
      return
    }
    if let json = try? JSONSerialization
      .jsonObject(with: data, options: .mutableContainers) {
        print(json)
    }
  }
}
