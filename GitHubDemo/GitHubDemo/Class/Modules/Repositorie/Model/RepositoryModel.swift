//
//  RepositoryModel.swift
//  GitHubDemo
//
//  Created by mac on 2021/1/16.
//

import Foundation

/// MARK - 仓库列表
struct Repositories: Decodable {
    let items: [Repository]
}


/// MARK - 仓库名
struct Repository {
    
    let name: String
    let fullName: String
    let description: String?

    enum CodingKeys: String, CodingKey {
        case name
        case description
        case fullName = "full_name"
    }
}

// MARK: - Decodable
extension Repository: Decodable {
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    name = try container.decode(String.self, forKey: .name)
    fullName = try container.decode(String.self, forKey: .fullName)
    description = try? container.decode(String.self, forKey: .description)
  }
}

