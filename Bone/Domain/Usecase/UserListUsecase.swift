//
//  Usecase.swift
//  Bone
//
//  Created by 박권용 on 1/21/26.
//

import Foundation

protocol UserListUsecaseProtocol {
	func fetchUser(query: String, page: Int) async -> Result<UserListResponse, NetworkError>
	func getFavoriteUsers() -> Result<[UserListItem], CoreDataError>
	func saveFavoriteUsers(user: UserListItem) -> Result<Bool, CoreDataError>
	func deleteFavoriteUser(userID: Int) -> Result<Bool, CoreDataError>
	func checkFavoriteState(fetchUsers: [UserListItem], favoriteUsers: [UserListItem]) -> [(user: UserListItem, isFavorite: Bool)]
	func convertListToDictionary(favoriteUsers: [UserListItem]) -> [String: [UserListItem]]
}

struct UserListUsecase: UserListUsecaseProtocol {
	
	let repository: UserRepositoryProtocol
	
	init(repository: UserRepositoryProtocol) {
		self.repository = repository
	}
	
	func fetchUser(query: String, page: Int) async -> Result<UserListResponse, NetworkError> {
		await repository.fetchUser(query: query, page: page)
	}
	
	func getFavoriteUsers() -> Result<[UserListItem], CoreDataError> {
		repository.getFavoriteUsers()
	}
	
	func saveFavoriteUsers(user: UserListItem) -> Result<Bool, CoreDataError> {
		repository.saveFavoriteUsers(user: user)
	}
	
	func deleteFavoriteUser(userID: Int) -> Result<Bool, CoreDataError> {
		repository.deleteFavoriteUser(userID: userID)
	}
	
	func checkFavoriteState(fetchUsers: [UserListItem], favoriteUsers: [UserListItem]) -> [(user: UserListItem, isFavorite: Bool)] {
		let favoriteUsersSet = Set(favoriteUsers)
		return fetchUsers.map { user in
			if favoriteUsersSet.contains(user) {
				return (user, true)
			} else {
				return (user, false)
			}
		}
	}
	
	func convertListToDictionary(favoriteUsers: [UserListItem]) -> [String : [UserListItem]] {
		let result = favoriteUsers.reduce(into: [String : [UserListItem]]()) { dict, user in
			if let key = user.login.first?.uppercased() {
				dict[key, default: []].append(user)
			}
		}
		return result
	}
	
}
