//
//  MainViewController.swift
//  Bone
//
//  Created by 박권용 on 12/29/25.
//

import UIKit
import KYKit

final class MainViewController: KYViewController {
	
	@IBOutlet public weak var moveScreenButton: UIButton!
	@IBOutlet public weak var moveScreenTwoButton: UIButton!
	@IBOutlet public weak var moveScreenThreeButton: UIButton!
	
	let viewModel = MainViewModel()

	override func viewDidLoad() {
		super.viewDidLoad()
		
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		VCStackDebugger.printRootViewController(label: "[Stack] Main [RootVC]")
		VCStackDebugger.printNavigationStack(nav: self.navigationController, label: "[Stack] Main [Navigation]")
		VCStackDebugger.printPresentStack(label: "[Stack] Main [Present]")
		VCStackDebugger.printVisibleViewController(label: "[Stack] Main [VisibleVC]")
	}
	
	override func setupViewStyle() {

	}
	
	@IBAction func didTapButton(_ sender: UIButton) {
		switch sender {
		case moveScreenButton:
			ChangeViewControllerProvider.shared.present(self, toVC: FirstDetailViewController())
		case moveScreenTwoButton:
			ChangeViewControllerProvider.shared.push(self, toVC: FirstDetailViewController())
		case moveScreenThreeButton:
			RootViewControllerProvider.shared.changeRootVC(.login)
		default: break
		}
	}

}
