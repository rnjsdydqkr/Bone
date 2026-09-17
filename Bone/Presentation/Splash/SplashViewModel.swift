//
//  SplashViewModel.swift
//  Bone
//
//  Created by 박권용 on 12/23/25.
//

import Combine
import Foundation
import KYKit

@MainActor final class SplashViewModel {

	// MARK: - Input / Output

	// MARK: - Properties

	// MARK: - Initializer

	// MARK: - Binding (Input → Output)

	// MARK: - Function (기능 로직 / 화면 이동)

	func delaySplash(_ screenType: ScreenType) async {
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
