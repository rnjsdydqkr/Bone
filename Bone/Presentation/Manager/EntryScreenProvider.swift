//
//  LaunchProvider.swift
//  Bone
//
//  Created by 박권용 on 12/29/25.
//

import UIKit
import KYKit

protocol EntryScreenProvider {
	func changeRootVC(_ vc: ScreenType)
}

extension EntryScreenProvider {
	func changeRootVC(_ vc: ScreenType) {
		var changeVC: KYViewController?
		changeVC = MainViewController(nibName: ScreenType.main.nibName, bundle: nil)
		
		switch vc {
		case .permission:
			changeVC = PermissionViewController(nibName: ScreenType.permission.nibName, bundle: nil)
		case .login:
			changeVC = LoginViewController(nibName: ScreenType.login.nibName, bundle: nil)
		case .main:
			changeVC = MainViewController(nibName: ScreenType.main.nibName, bundle: nil)
		@unknown default:
			fatalError()
		}
		
		guard let targetVC = changeVC else { return }
		
		let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
		sceneDelegate?.changeRootNavigationController(targetVC)
	}
}
