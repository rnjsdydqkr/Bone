//
//  TopicListUsecase.swift
//  Bone
//
//  Created by 박권용 on 1/26/26.
//

import Foundation

protocol TopicListUsecaseProtocol {
	func fetchTopic(query: String, page: Int) async -> Result<TopicListResponse, NetworkError>
}

struct TopicListUsecase: TopicListUsecaseProtocol {
	private var repository: TopicRepositoryProtocol
	init(repository: TopicRepositoryProtocol) {
		self.repository = repository
	}
	
	func fetchTopic(query: String, page: Int) async -> Result<TopicListResponse, NetworkError> {
		await repository.fetchTopic(query: query, page: page)
	}
	
	
}
