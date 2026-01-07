//
//  PermissionViewController.swift
//  Bone
//
//  Created by 박권용 on 12/29/25.
//

import UIKit
import KYKit

class PermissionViewController: KYViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
			
			if let viewControllers = self.navigationController?.viewControllers {
					for (index, vc) in viewControllers.enumerated() {
							print("[Permission] [\(index)] \(type(of: vc))")
					}
			}
			
			if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
				 let rootVC = windowScene.windows.first?.rootViewController {
					print("[Permission] 현재 루트 뷰 컨트롤러: \(type(of: rootVC))")
			}

    }

}
