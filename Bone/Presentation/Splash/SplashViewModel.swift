//
//  SplashViewModel.swift
//  Bone
//
//  Created by 박권용 on 12/23/25.
//

import Foundation
import KYKit

final class SplashViewModel: EntryScreenProvider {
	
	func delaySplash(_ screenType: ScreenType) async {
		try? await Task.sleep(for: .seconds(0.5))
		await MainActor.run {
			self.changeScreen(screenType)
		}
	}
	
	private func changeScreen(_ screenType: ScreenType) {
		changeRootVC(screenType)
	}
}
