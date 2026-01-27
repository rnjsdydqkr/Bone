//
//  TopicNetwork.swift
//  Bone
//
//  Created by 박권용 on 1/26/26.
//

import Foundation
import Alamofire

protocol TopicNetworkProtocol {
	func fetchUser(query: String, pg: Int) async -> Result<TopicListResponse, NetworkError>
}

final class TopicNetwork: TopicNetworkProtocol {
	private var manager: NetworkManagerProtocol
	init(manager: NetworkManagerProtocol) {
		self.manager = manager
	}
	func fetchUser(query: String, pg: Int)  async -> Result<TopicListResponse, NetworkError> {
		let url = "https://api.github.com/search/topics?q=\(query)&page=\(pg)"
		return await manager.fetchData(url: url, method: .get, parameters: nil)
	}
	
}
