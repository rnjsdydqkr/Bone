//
//  LaunchProvider.swift
//  Bone
//
//  Created by 박권용 on 12/29/25.
//

import UIKit
import KYKit

class RootViewControllerProvider {

	// MARK: - Properties

	static let shared = RootViewControllerProvider()

	// MARK: - Function (기능 로직 / 화면 이동)

	func changeRootVC(_ vc: ScreenType) {
		var changeVC: UIViewController?

		switch vc {
		case .permission:
			changeVC = PermissionViewController()
		case .login:
			changeVC = LoginViewController()
		case .main:
			changeVC = MainViewController()
		@unknown default:
			fatalError()
		}

		guard let targetVC = changeVC else { return }

		let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
		sceneDelegate?.changeRootNavigationController(targetVC)
	}

}
