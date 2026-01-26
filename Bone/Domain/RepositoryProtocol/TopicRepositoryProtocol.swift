//
//  TopicRepositoryProtocol.swift
//  Bone
//
//  Created by 박권용 on 1/26/26.
//

import Foundation

protocol TopicRepositoryProtocol {
	func fetchTopic(query: String, page: Int) async -> Result<TopicListResponse, NetworkError>
}
