//
//  MJSessionManager.swift
//  GitHubDemo
//
//  Created by mac on 2021/1/16.
//

import Foundation
import Alamofire

let sessionManager: Session = {
  let configuration = URLSessionConfiguration.af.default
  
  configuration.requestCachePolicy = .returnCacheDataElseLoad
  let responseCacher = ResponseCacher(behavior: .modify { _, response in
    let userInfo = ["date": Date()]
    return CachedURLResponse(
      response: response.response,
      data: response.data,
      userInfo: userInfo,
      storagePolicy: .allowed)
  })

    let networkLogger = GitNetworkLogger()

  //4
  return Session(
    configuration: configuration,
    cachedResponseHandler: responseCacher,
    eventMonitors: [networkLogger])
}()

