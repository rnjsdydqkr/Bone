//
//  ViewController.swift
//  Bone
//
//  Created by 박권용 on 12/19/25.
//

import UIKit
import KYKit

final class SplashViewController: KYViewController {
	
	private let viewModel = SplashViewModel()

	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func setupViewStyle() {

	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		VCStackDebugger.printNavigationStack(label: "Splash")
		VCStackDebugger.printRootViewController(nav: self.navigationController, label: "Splash")
		
		viewModel.changeScreen()
	}

}
