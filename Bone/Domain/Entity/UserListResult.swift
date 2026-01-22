//
//  UserListResult.swift
//  Bone
//
//  Created by 박권용 on 1/21/26.
//

import Foundation

// MARK: - SearchUserResponse
struct UserListResult: Codable {
	let totalCount: Int
	let incompleteResults: Bool
	let items: [UserListItem]

	enum CodingKeys: String, CodingKey {
			case totalCount = "total_count"
			case incompleteResults = "incomplete_results"
			case items
	}
	
	init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.totalCount = try container.decode(Int.self, forKey: .totalCount)
		self.incompleteResults = try container.decode(Bool.self, forKey: .incompleteResults)
		self.items = try container.decode([UserListItem].self, forKey: .items)
	}

}

// MARK: - UserListItem
struct UserListItem: Codable, Identifiable, Hashable {
	let login: String
	let id: Int
	let imageURL: String

	enum CodingKeys: String, CodingKey {
		case login, id
		case imageURL = "avatar_url"
	}
	
	init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.login = try container.decode(String.self, forKey: .login)
		self.id = try container.decode(Int.self, forKey: .id)
		self.imageURL = try container.decode(String.self, forKey: .imageURL)
	}
	
}
