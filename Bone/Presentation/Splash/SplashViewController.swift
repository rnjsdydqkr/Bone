//
//  ViewController.swift
//  Bone
//
//  Created by 박권용 on 12/19/25.
//

import UIKit
import KYKit
import Combine

final class SplashViewController: KYViewController {

	// MARK: - IBOutlet

	@IBOutlet public weak var moveScreenButton: UIButton!
	@IBOutlet public weak var moveScreenTwoButton: UIButton!

	// MARK: - Properties

	private let viewModel = SplashViewModel()
  
  private let viewDidAppearSubject = PassthroughSubject<Void, Never>()
  
  private let moveScreenButtonTappedSubject = PassthroughSubject<Void, Never>()
  private let moveScreenTwoButtonTappedSubject = PassthroughSubject<Void, Never>()

	// MARK: - Life Cycle

	override func viewDidLoad() {
		super.viewDidLoad()
    bindViewModel()
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)

		VCStackDebugger.printRootViewController(label: "[Stack] Splash [RootVC]")
		VCStackDebugger.printNavigationStack(nav: self.navigationController, label: "[Stack] Splash [Navigation]")
		VCStackDebugger.printPresentStack(label: "[Stack] Splash [Present]")
		VCStackDebugger.printVisibleViewController(label: "[Stack] Splash [VisibleVC]")
		print("**************************************")
		print("**************************************")
	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
    viewDidAppearSubject.send()
	}

	// MARK: - Setup (초기 세팅)
  
  private func bindViewModel() {
    let input = SplashViewModel.Input(
      viewDidAppear: viewDidAppearSubject.eraseToAnyPublisher(),
      moveScreenButtonTapped: moveScreenButtonTappedSubject.eraseToAnyPublisher(),
      moveScreenTwoButtonTapped: moveScreenTwoButtonTappedSubject.eraseToAnyPublisher()
    )
    
    let output = viewModel.transform(input: input)

  }

	// MARK: - Binding (ViewModel 바인딩 / 구독)

	// MARK: - UI (뷰 갱신 / 스타일)

	override func setupViewStyle() {

	}

	// MARK: - Function (기능 로직 / 화면 이동)

	// MARK: - Action (사용자 이벤트)

	@IBAction func didTapButton(_ sender: UIButton) {
		switch sender {
		case moveScreenButton: moveScreenButtonTappedSubject.send()
    case moveScreenTwoButton: moveScreenTwoButtonTappedSubject.send()
		default: break
		}
	}

}
