//
//  VCStack.swift
//  Bone
//
//  Created by 박권용 on 1/7/26.
//

import UIKit

struct VCStackDebugger {
	static func printRootViewController(nav: UINavigationController?, label: String = "Debug") {
		guard let viewControllers = nav?.viewControllers else {
			print("[\(label)] 네비게이션 컨트롤러가 존재하지 않습니다.")
				return
		}
		print("--- [\(label)] Navigation Stack Start ---")
		for (index, vc) in viewControllers.enumerated() {
				print("[\(label)] [\(index)] \(type(of: vc))")
		}
		print("--- [\(label)] Navigation Stack End ---")
	}
	static func printNavigationStack(label: String = "Debug") {
		guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
			 let rootVC = windowScene.windows.first?.rootViewController else {
				print("[\(label)] 루트 뷰 컨트롤러를 찾을 수 없습니다.")
				return
		}
		print("[\(label)] 현재 루트 뷰 컨트롤러: \(type(of: rootVC))")
	}
}
