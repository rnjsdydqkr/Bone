//
//  ViewController.swift
//  Bone
//
//  Created by 박권용 on 12/19/25.
//

import UIKit
import KYKit

final class SplashViewController: KYViewController {
	
	@IBOutlet private weak var titleLabel: UILabel!
	@IBOutlet private weak var subTitleLabel: UILabel!
	
	@IBOutlet private weak var confirmButton: UIButton!
	@IBOutlet private weak var cancelButton: UIButton!
	
	private let viewModel = SplashViewModel()

	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func setupViewStyle() {

	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		if let viewControllers = self.navigationController?.viewControllers {
				for (index, vc) in viewControllers.enumerated() {
						print("[Splash]] [\(index)] \(type(of: vc))")
				}
		}
		
		if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
			 let rootVC = windowScene.windows.first?.rootViewController {
				print("[Splash]] 현재 루트 뷰 컨트롤러: \(type(of: rootVC))")
		}
		
		viewModel.changeScreen()
	}

}
