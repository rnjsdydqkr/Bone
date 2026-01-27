//
//  Repository.swift
//  Bone
//
//  Created by 박권용 on 1/26/26.
//

import Foundation

struct UserRepository: UserRepositoryProtocol {
	private let network: UserNetworkProtocol
	init(network: UserNetworkProtocol) {
		self.network = network
	}
	
	func fetchUser(query: String, page: Int) async -> Result<UserListResponse, NetworkError> {
		return await network.fetchUser(query: query, page: page)
	}
	
	func getFavoriteUsers() -> Result<[UserListItem], CoreDataError> {
		/// TODO
//		return network.getFavoriteUsers()
		return .success([])
	}
	
	func saveFavoriteUsers(user: UserListItem) -> Result<Bool, CoreDataError> {
		/// TODO
//		return network.saveFavoriteUsers(user: user)
		return .success(false)
	}
	
	func deleteFavoriteUser(userID: Int) -> Result<Bool, CoreDataError> {
		/// TODO
//		return network.deleteFavoriteUser(userID: userID)
		return .success(false)
	}
	
	
}
