//
//  FirstDetailViewController.swift
//  Bone
//
//  Created by 박권용 on 1/7/26.
//

import UIKit

class FirstDetailViewController: UIViewController {
	
	@IBOutlet private weak var moveScreenButton: UIButton!
	@IBOutlet private weak var moveScreenTwoButton: UIButton!
	
	let viewModel = FirstDetailViewModel()

	override func viewDidLoad() {
		super.viewDidLoad()
		setGestureRecognizer()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		VCStackDebugger.printNavigationStack(label: "FirstDetail")
		VCStackDebugger.printRootViewController(nav: self.navigationController, label: "FirstDetail")
		VCStackDebugger.printPresentStack(label: "FirstDetail")
	}
	
	override func viewDidAppear(_ animated: Bool) {
			super.viewDidAppear(animated)
			VCStackDebugger.printVisibleViewController(label: "FirstDetail")
	}
	
	@IBAction func didTapButton(_ sender: UIButton) {
		switch sender {
		case moveScreenButton:
			moveThirdDetailVC()
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
	
	private func setGestureRecognizer() {
		let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
		swipeDown.direction = .right
		self.view.addGestureRecognizer(swipeDown)
	}
	
	@objc func handleSwipe() {
			self.dismiss(animated: true)
	}

}
