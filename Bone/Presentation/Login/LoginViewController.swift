//
//  LoginViewController.swift
//  Bone
//
//  Created by 박권용 on 12/29/25.
//

import UIKit
import KYKit

class LoginViewController: KYViewController {
	
	@IBOutlet private weak var titleLabel: UILabel!
	@IBOutlet private weak var subTitleLabel: UILabel!
	
	@IBOutlet private weak var confirmButton: UIButton!
	@IBOutlet private weak var cancelButton: UIButton!
	@IBOutlet public weak var moveScreenButton: UIButton!

	override func viewDidLoad() {
			super.viewDidLoad()
		
		VCStackDebugger.printRootViewController(label: "[Stack] Login [RootVC]")
		VCStackDebugger.printNavigationStack(nav: self.navigationController, label: "[Stack] Login [Navigation]")
		VCStackDebugger.printPresentStack(label: "[Stack] Login [Present]")
		VCStackDebugger.printVisibleViewController(label: "[Stack] Login [VisibleVC]")
	}

	override func setupViewStyle() {

	}
	
	@IBAction func didTapButton(_ sender: UIButton) {
		switch sender {
		case confirmButton:
			ChangeViewControllerProvider.shared.present(self, toVC: FirstDetailViewController())
		case cancelButton:
			ChangeViewControllerProvider.shared.push(self, toVC: FirstDetailViewController())
		case moveScreenButton:
			RootViewControllerProvider.shared.changeRootVC(.main)
		default: break
		}
	}

}
