//
//  FourDetailViewController.swift
//  Bone
//
//  Created by 박권용 on 1/7/26.
//

import UIKit
import KYKit

class FourDetailViewController: KYViewController {
	
	@IBOutlet private weak var moveScreenButton: UIButton!
	@IBOutlet private weak var moveScreenTwoButton: UIButton!
	@IBOutlet private weak var moveScreenThreeButton: UIButton!
	
	let viewModel = FourDetailViewModel()

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		VCStackDebugger.printRootViewController(label: "[Stack] FourDetail [RootVC]")
		VCStackDebugger.printNavigationStack(nav: self.navigationController, label: "[Stack] FourDetail [Navigation]")
		VCStackDebugger.printPresentStack(label: "[Stack] FourDetail [Present]")
		VCStackDebugger.printVisibleViewController(label: "[Stack] FourDetail [VisibleVC]")
	}
	
	override func viewDidAppear(_ animated: Bool) {
			super.viewDidAppear(animated)
	}
	
	@IBAction func didTapButton(_ sender: UIButton) {
		switch sender {
		case moveScreenButton:
			ChangeViewControllerProvider.shared.present(self, toVC: FirstDetailViewController())
//			ChangeViewControllerProvider.shared.present(self, toVC: SecondDetailViewController())
		case moveScreenTwoButton:
			ChangeViewControllerProvider.shared.push(self, toVC: FirstDetailViewController())
		case moveScreenThreeButton:
			RootViewControllerProvider.shared.changeRootVC(.permission)
		default: break
		}
	}

}
