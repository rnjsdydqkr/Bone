//
//  SecondDetailViewController.swift
//  Bone
//
//  Created by 박권용 on 1/7/26.
//

import UIKit

class SecondDetailViewController: UIViewController {
	
	@IBOutlet private weak var moveScreenButton: UIButton!
	@IBOutlet private weak var moveScreenTwoButton: UIButton!
	
	let viewModel = SecondDetailViewModel()

	override func viewDidLoad() {
			super.viewDidLoad()

	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		VCStackDebugger.printNavigationStack(label: "SecondDetail")
		VCStackDebugger.printRootViewController(nav: self.navigationController, label: "SecondDetail")
		VCStackDebugger.printPresentStack(label: "SecondDetail")
	}
	
	override func viewDidAppear(_ animated: Bool) {
			super.viewDidAppear(animated)
			VCStackDebugger.printVisibleViewController(label: "SecondDetail")
	}
	
	@IBAction func didTapButton(_ sender: UIButton) {
		switch sender {
		case moveScreenButton: moveFirstDetailVC()
		case moveScreenTwoButton: moveNavSecondDetailVC()
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
