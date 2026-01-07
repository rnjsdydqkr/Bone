//
//  LoginViewController.swift
//  Bone
//
//  Created by 박권용 on 12/29/25.
//

import UIKit
import KYKit

class LoginViewController: KYViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
			
			if let viewControllers = self.navigationController?.viewControllers {
					for (index, vc) in viewControllers.enumerated() {
							print("[Login] [\(index)] \(type(of: vc))")
					}
			}
			
			if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
				 let rootVC = windowScene.windows.first?.rootViewController {
					print("[Login] 현재 루트 뷰 컨트롤러: \(type(of: rootVC))")
			}

    }

}
