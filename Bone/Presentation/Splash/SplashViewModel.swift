//
//  SplashViewModel.swift
//  Bone
//
//  Created by 박권용 on 12/23/25.
//

import Foundation
import KYKit
import Combine

@MainActor final class SplashViewModel: ViewModel {

	// MARK: - Input / Output

	struct Input {
		let viewDidAppear: AnyPublisher<Void, Never>
		let moveScreenButtonTapped: AnyPublisher<Void, Never>
		let moveScreenTwoButtonTapped: AnyPublisher<Void, Never>
	}

	struct Output {

	}

	// MARK: - Properties

	private var cancellables = Set<AnyCancellable>()

	// MARK: - Initializer

	// MARK: - Binding (Input → Output)

	func transform(input: Input) -> Output {
		input.viewDidAppear
			.sink { [weak self] _ in
				Task {
					await self?.delaySplash(.main)
				}
			}.store(in: &cancellables)

		input.moveScreenButtonTapped
			.sink { [weak self] _ in
				print("moveScreenButtonTapped")
			}.store(in: &cancellables)

		input.moveScreenTwoButtonTapped
			.sink { [weak self] _ in
				print("moveScreenTwoButtonTapped")
			}.store(in: &cancellables)

		return Output()
	}

	// MARK: - Function (기능 로직 / 화면 이동)

	private func delaySplash(_ screenType: ScreenType) async {
		try? await Task.sleep(for: .seconds(0.5))
		await MainActor.run {
			self.changeScreen(screenType)
		}
	}

	private func changeScreen(_ screenType: ScreenType) {
		RootViewControllerProvider.shared.changeRootVC(screenType)
	}

	// MARK: - API Request

	// MARK: - API Response

}
