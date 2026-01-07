//
//  FourDetailViewController.swift
//  Bone
//
//  Created by 박권용 on 1/7/26.
//

import UIKit

class FourDetailViewController: UIViewController {
	
	@IBOutlet private weak var moveScreenButton: UIButton!
	@IBOutlet private weak var moveScreenTwoButton: UIButton!
	
	let viewModel = FourDetailViewModel()

	override func viewDidLoad() {
			super.viewDidLoad()

	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		VCStackDebugger.printNavigationStack(label: "FourDetail")
		VCStackDebugger.printRootViewController(nav: self.navigationController, label: "FourDetail")
		VCStackDebugger.printPresentStack(label: "FourDetail")
	}
	
	override func viewDidAppear(_ animated: Bool) {
			super.viewDidAppear(animated)
		VCStackDebugger.printVisibleViewController(label: "FourDetail")
	}
	
	@IBAction func didTapButton(_ sender: UIButton) {
		switch sender {
		case moveScreenButton:
			moveNavSecondDetailVC()
		case moveScreenTwoButton:
			self.dismiss(animated: true, completion: nil)
		default: break
		}
	}
	
	private func moveFirstDetailVC() {
		let vc = viewModel.makeFirstDetailVC()
		self.present(vc, animated: true)
	}
	
	private func moveNavSecondDetailVC() {
		let vc = viewModel.makeSecondDetailVC()
		self.navigationController?.pushViewController(vc, animated: true)
	}
	
	private func moveThirdDetailVC() {
		let vc = viewModel.makeThirdDetailVC()
		self.present(vc, animated: true)
	}
	
	private func moveFourDetailVC() {
		let vc = viewModel.makeFourDetailVC()
		self.present(vc, animated: true)
	}

}
