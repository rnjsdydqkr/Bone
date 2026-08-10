//
//  MainViewModel.swift
//  Bone
//
//  Created by 박권용 on 12/29/25.
//

import Foundation

final class MainViewModel {
	private let usecase: UserListUsecaseProtocol

	init(usecase: UserListUsecaseProtocol) {
		self.usecase = usecase
	}

	func fetchUser(query: String, page: Int) async -> Result<UserListResponse, NetworkError> {
		await usecase.fetchUser(query: query, page: page)
	}
}
