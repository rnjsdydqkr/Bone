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
		print("[Stack] ===================================")
		for (index, vc) in viewControllers.enumerated() {
				print("[\(label)] [\(index)] \(type(of: vc))")
		}
		print("[Stack] ===================================")
	}
	/// 현재 Root부터 Present된 모든 뷰 컨트롤러 계층을 출력합니다.
	static func printPresentStack(label: String = "Debug") {
		guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
					var currentVC = windowScene.windows.first?.rootViewController else {
				print("[\(label)] 루트 뷰 컨트롤러를 찾을 수 없습니다.")
				return
		}

		print("[Stack] ===================================")
		print("[Stack] [Root]: \(type(of: currentVC))")

		// presentedViewController가 nil이 아닐 때까지 계속 추적
		while let presentedVC = currentVC.presentedViewController {
			currentVC = presentedVC
			print("[Stack] [Presented]: \(type(of: presentedVC))")
		}
		print("[Stack] ===================================")
	}
	
	static func printVisibleViewController(label: String = "Debug") {
			guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
						let root = windowScene.windows.first?.rootViewController else { return }
			
			var currentVC: UIViewController? = root
			
			while let presented = currentVC?.presentedViewController {
					currentVC = presented
			}
			
			if let nav = currentVC as? UINavigationController {
					currentVC = nav.visibleViewController
			}
			
			print("[\(label)] 사용자가 보고 있는 최상단 VC: \(type(of: currentVC!))")
		
			print("[Stack]")
	}
}
