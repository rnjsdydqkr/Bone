//
//  ThirdDetailViewController.swift
//  Bone
//
//  Created by 박권용 on 1/7/26.
//

import UIKit
import KYKit

class ThirdDetailViewController: KYViewController {
	
	@IBOutlet private weak var moveScreenButton: UIButton!
	@IBOutlet private weak var moveScreenTwoButton: UIButton!
	
	let viewModel = ThirdDetailViewModel()

	override func viewDidLoad() {
		super.viewDidLoad()
		setupDismissSwipeGesture()
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		VCStackDebugger.printRootViewController(label: "[Stack] ThirdDetail [RootVC]")
		VCStackDebugger.printNavigationStack(nav: self.navigationController, label: "[Stack] ThirdDetail [Navigation]")
		VCStackDebugger.printPresentStack(label: "[Stack] ThirdDetail [Present]")
		VCStackDebugger.printVisibleViewController(label: "[Stack] ThirdDetail [VisibleVC]")
	}
	
	override func viewDidAppear(_ animated: Bool) {
			super.viewDidAppear(animated)
		setupDismissSwipeGesture()
	}
	
	@IBAction func didTapButton(_ sender: UIButton) {
		switch sender {
		case moveScreenButton:
			ChangeViewControllerProvider.shared.present(self, toVC: FourDetailViewController())
		case moveScreenTwoButton:
			ChangeViewControllerProvider.shared.push(self, toVC: FourDetailViewController())
		default: break
		}
	}

}
