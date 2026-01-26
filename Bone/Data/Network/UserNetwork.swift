//
//  UserNetwork.swift
//  Bone
//
//  Created by 박권용 on 1/26/26.
//

import Foundation
import Alamofire

protocol UserNetworkProtocol {
	func fetchUser(query: String, page: Int) async -> Result<UserListResponse, NetworkError>
}

final class UserNetwork: UserNetworkProtocol {
	private var manager: NetworkManagerProtocol
	init(manager: NetworkManagerProtocol) {
		self.manager = manager
	}
	func fetchUser(query: String, page: Int) async -> Result<UserListResponse, NetworkError> {
		let url = "https://api.github.com/search/users?q=\(query)&page=\(page)"
		return await manager.fetchData(url: url, method: .get, parameters: nil)
	}
	
}
