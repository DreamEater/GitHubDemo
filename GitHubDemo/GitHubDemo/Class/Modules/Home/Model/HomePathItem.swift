//
//  HomePathItem.swift
//  GitHubDemo
//
//  Created by mac on 2021/1/16.
//

import Foundation

class HomePathItem {
    init(name: String, path: String) {
        self.url_name = name
        self.url_path = path
    }
    
    var url_name: String
    var url_path: String
}

