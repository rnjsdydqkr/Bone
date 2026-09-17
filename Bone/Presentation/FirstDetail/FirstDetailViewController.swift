//
//  FirstDetailViewController.swift
//  Bone
//
//  Created by 박권용 on 1/7/26.
//

import UIKit
import KYKit

class FirstDetailViewController: KYViewController {

	// MARK: - IBOutlet

	@IBOutlet private weak var moveScreenButton: UIButton!
	@IBOutlet private weak var moveScreenTwoButton: UIButton!

	// MARK: - Properties

	let viewModel = FirstDetailViewModel()

	// MARK: - Life Cycle

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

	// MARK: - Setup (초기 세팅)

//	private func setGestureRecognizer() {
//		let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
//		swipeDown.direction = .right
//		self.view.addGestureRecognizer(swipeDown)
//	}

	// MARK: - Binding (ViewModel 바인딩 / 구독)

	// MARK: - UI (뷰 갱신 / 스타일)

	// MARK: - Function (기능 로직 / 화면 이동)

	// MARK: - Action (사용자 이벤트)

	@IBAction func didTapButton(_ sender: UIButton) {
		switch sender {
		case moveScreenButton:
			ChangeViewControllerProvider.shared.present(self, toVC: SecondDetailViewController())
		case moveScreenTwoButton:
			ChangeViewControllerProvider.shared.push(self, toVC: SecondDetailViewController())
		default: break
		}
	}

//	@objc func handleSwipe() {
//		self.dismiss(animated: true)
//	}

}
