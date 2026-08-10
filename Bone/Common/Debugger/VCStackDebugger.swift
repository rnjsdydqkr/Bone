//
//  VCStack.swift
//  Bone
//
//  Created by 박권용 on 1/7/26.
//

import UIKit

struct VCStackDebugger {
	static func printRootViewController(label: String = "Debug") {
		guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
			 let rootVC = windowScene.windows.first?.rootViewController else {
				print("[\(label)] 루트 뷰 컨트롤러를 찾을 수 없습니다.")
				return
		}
		print("[\(label)] 현재 루트 뷰 컨트롤러: \(type(of: rootVC))")
	}
	static func printNavigationStack(nav: UINavigationController?, label: String = "Debug") {
		guard let viewControllers = nav?.viewControllers else {
			print("[\(label)] 네비게이션 컨트롤러가 존재하지 않습니다.")
				return
		}
		print("===================================")
		for (index, vc) in viewControllers.enumerated() {
				print("[\(label)] [\(index)] \(type(of: vc))")
		}
		print("===================================")
	}
	/// 현재 Root부터 Present된 모든 뷰 컨트롤러 계층을 출력합니다.
	static func printPresentStack(label: String = "Debug") {
		guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
					var currentVC = windowScene.windows.first?.rootViewController else {
				print("[\(label)] 루트 뷰 컨트롤러를 찾을 수 없습니다.")
				return
		}

		print("===================================")
		print("[\(label)] [Root]: \(type(of: currentVC))")

		// presentedViewController가 nil이 아닐 때까지 계속 추적
		// dismiss 애니메이션이 끝나야 관계가 끊기므로, 사라지는 중인 VC는 제외한다
		while let presentedVC = currentVC.presentedViewController, !presentedVC.isBeingDismissed {
			currentVC = presentedVC
			print("[\(label)] [Presented]: \(type(of: presentedVC))")
		}
		print("===================================")
	}
	
	static func printVisibleViewController(label: String = "Debug") {
			guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
						let root = windowScene.windows.first?.rootViewController else { return }
			
			var currentVC: UIViewController? = root
			
			// dismiss 중인 VC는 아직 관계가 살아있을 뿐 사용자에게 보이는 화면이 아니므로 제외한다
			while let presented = currentVC?.presentedViewController, !presented.isBeingDismissed {
					currentVC = presented
			}
			
			if let nav = currentVC as? UINavigationController {
					currentVC = nav.visibleViewController
			}
			
			print("[\(label)] 사용자가 보고 있는 최상단 VC: \(type(of: currentVC!))")
	}
}
