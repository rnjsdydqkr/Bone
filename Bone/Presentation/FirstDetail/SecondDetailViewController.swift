//
//  SecondDetailViewController.swift
//  Bone
//
//  Created by 박권용 on 1/7/26.
//

import UIKit
import KYKit

class SecondDetailViewController: KYViewController {
	
	@IBOutlet private weak var moveScreenButton: UIButton!
	@IBOutlet private weak var moveScreenTwoButton: UIButton!
	
	let viewModel = SecondDetailViewModel()

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		VCStackDebugger.printRootViewController(label: "[Stack] SecondDetail [RootVC]")
		VCStackDebugger.printNavigationStack(nav: self.navigationController, label: "[Stack] SecondDetail [Navigation]")
		VCStackDebugger.printPresentStack(label: "[Stack] SecondDetail [Present]")
		VCStackDebugger.printVisibleViewController(label: "[Stack] SecondDetail [VisibleVC]")
	}
	
	override func viewDidAppear(_ animated: Bool) {
			super.viewDidAppear(animated)
		setupDismissSwipeGesture()
	}
	
	@IBAction func didTapButton(_ sender: UIButton) {
		switch sender {
		case moveScreenButton:
			ChangeViewControllerProvider.shared.present(self, toVC: ThirdDetailViewController())
		case moveScreenTwoButton:
			ChangeViewControllerProvider.shared.push(self, toVC: ThirdDetailViewController())
		default: break
		}
	}

}
