//
//  MainViewModel.swift
//  Bone
//
//  Created by 박권용 on 12/29/25.
//

import Foundation

final class MainViewModel {

	// MARK: - Input / Output

	// MARK: - Properties

	private let usecase: UserListUsecaseProtocol

	// MARK: - Initializer

	init(usecase: UserListUsecaseProtocol) {
		self.usecase = usecase
	}

	// MARK: - Binding (Input → Output)

	// MARK: - Function (기능 로직 / 화면 이동)

	// MARK: - API Request

	func fetchUser(query: String, page: Int) async -> Result<UserListResponse, NetworkError> {
		await usecase.fetchUser(query: query, page: page)
	}

	// MARK: - API Response

}
