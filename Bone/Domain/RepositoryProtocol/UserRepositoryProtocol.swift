//
//  UserRepositoryProtocol.swift
//  Bone
//
//  Created by 박권용 on 1/21/26.
//

import Foundation

protocol UserRepositoryProtocol {
	func fetchUser(query: String, page: Int) async -> Result<UserListResponse, NetworkError>
	func getFavoriteUsers() -> Result<[UserListItem], CoreDataError>
	func saveFavoriteUsers(user: UserListItem) -> Result<Bool, CoreDataError>
	func deleteFavoriteUser(userID: Int) -> Result<Bool, CoreDataError>
}
