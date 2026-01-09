//
//  FirstDetailViewController.swift
//  Bone
//
//  Created by 박권용 on 1/7/26.
//

import UIKit
import KYKit

class FirstDetailViewController: KYViewController {
	
	@IBOutlet private weak var moveScreenButton: UIButton!
	@IBOutlet private weak var moveScreenTwoButton: UIButton!
	
	let viewModel = FirstDetailViewModel()

	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		VCStackDebugger.printRootViewController(label: "[Stack] FirstDetail [RootVC]")
		VCStackDebugger.printNavigationStack(nav: self.navigationController, label: "[Stack] FirstDetail [Navigation]")
		VCStackDebugger.printPresentStack(label: "[Stack] FirstDetail [Present]")
		VCStackDebugger.printVisibleViewController(label: "[Stack] FirstDetail [VisibleVC]")
	}
	
	override func viewDidAppear(_ animated: Bool) {
			super.viewDidAppear(animated)
	}
	
	@IBAction func didTapButton(_ sender: UIButton) {
		switch sender {
		case moveScreenButton:
			ChangeViewControllerProvider.shared.present(self, toVC: SecondDetailViewController())
		case moveScreenTwoButton:
			ChangeViewControllerProvider.shared.push(self, toVC: SecondDetailViewController())
		default: break
		}
	}
	
//	private func setGestureRecognizer() {
//		let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
//		swipeDown.direction = .right
//		self.view.addGestureRecognizer(swipeDown)
//	}
//	
//	@objc func handleSwipe() {
//			self.dismiss(animated: true)
//	}

}
