//
//  ViewController.swift
//  Bone
//
//  Created by 박권용 on 12/19/25.
//

import UIKit
import KYKit

final class SplashViewController: KYViewController {
	
	@IBOutlet public weak var moveScreenButton: UIButton!
	@IBOutlet public weak var moveScreenTwoButton: UIButton!
	
	private let viewModel = SplashViewModel()

	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func setupViewStyle() {

	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		VCStackDebugger.printRootViewController(label: "[Stack] Splash [RootVC]")
		VCStackDebugger.printNavigationStack(nav: self.navigationController, label: "[Stack] Splash [Navigation]")
		VCStackDebugger.printPresentStack(label: "[Stack] Splash [Present]")
		VCStackDebugger.printVisibleViewController(label: "[Stack] Splash [VisibleVC]")
		print("**************************************")
		print("**************************************")
		
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		Task {
			await viewModel.delaySplash(.main)
		}
	}
	
	@IBAction func didTapButton(_ sender: UIButton) {
		switch sender {
		case moveScreenButton: break
		case moveScreenTwoButton: break
		default: break
		}
	}

}
