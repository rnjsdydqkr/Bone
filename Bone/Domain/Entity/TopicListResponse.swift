//
//  TopicListResponse.swift
//  Bone
//
//  Created by 박권용 on 1/26/26.
//

import Foundation

struct TopicListResponse: Codable {
	let totalCount: Int
	let incompleteResults: Bool
	let items: [TopicItem]

	enum CodingKeys: String, CodingKey {
		case totalCount = "total_count"
		case incompleteResults = "incomplete_results"
		case items
	}
	
	init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.totalCount = try container.decode(Int.self, forKey: .totalCount)
		self.incompleteResults = try container.decode(Bool.self, forKey: .incompleteResults)
		self.items = try container.decode([TopicItem].self, forKey: .items)
	}
		
}

struct TopicItem: Codable {
	let name: String
	let displayName: String?
	let shortDescription: String?
	let description: String?
	let createdBy: String?
	let released: String? // 혹은 날짜 형식이 확실하다면 Date
	let createdAt: Date?
	let updatedAt: Date?
	let featured: Bool
	let curated: Bool
	let score: Double

	enum CodingKeys: String, CodingKey {
		case name
		case displayName = "display_name"
		case shortDescription = "short_description"
		case description
		case createdBy = "created_by"
		case released
		case createdAt = "created_at"
		case updatedAt = "updated_at"
		case featured
		case curated
		case score
	}
	
	init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.name = try container.decode(String.self, forKey: .name)
		self.displayName = try container.decodeIfPresent(String.self, forKey: .displayName)
		self.shortDescription = try container.decodeIfPresent(String.self, forKey: .shortDescription)
		self.description = try container.decodeIfPresent(String.self, forKey: .description)
		self.createdBy = try container.decodeIfPresent(String.self, forKey: .createdBy)
		self.released = try container.decodeIfPresent(String.self, forKey: .released)
		self.createdAt = try container.decodeIfPresent(Date.self, forKey: .createdAt)
		self.updatedAt = try container.decodeIfPresent(Date.self, forKey: .updatedAt)
		self.featured = try container.decode(Bool.self, forKey: .featured)
		self.curated = try container.decode(Bool.self, forKey: .curated)
		self.score = try container.decode(Double.self, forKey: .score)
	}
}
