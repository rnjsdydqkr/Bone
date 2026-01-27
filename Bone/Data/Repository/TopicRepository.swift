//
//  TopicRepository.swift
//  Bone
//
//  Created by 박권용 on 1/27/26.
//

import Foundation

struct TopicRepository: TopicRepositoryProtocol {
	private var network: TopicNetworkProtocol
	init(network: TopicNetworkProtocol) {
		self.network = network
	}
	
	func fetchTopic(query: String, page: Int) async -> Result<TopicListResponse, NetworkError> {
		return await network.fetchUser(query: query, pg: page)
	}
	
}
