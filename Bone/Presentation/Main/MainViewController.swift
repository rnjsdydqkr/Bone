//
//  MainViewController.swift
//  Bone
//
//  Created by 박권용 on 12/29/25.
//

import UIKit
import KYKit

final class MainViewController: KYViewController {

	// MARK: - IBOutlet

	@IBOutlet public weak var moveScreenButton: UIButton!
	@IBOutlet public weak var moveScreenTwoButton: UIButton!
	@IBOutlet public weak var moveScreenThreeButton: UIButton!

	// MARK: - Properties

	private let viewModel: MainViewModel = {
		let session = UserSession()
		let manager = NetworkManager(session: session)
		let network = UserNetwork(manager: manager)
		let repository = UserRepository(network: network)
		let usecase = UserListUsecase(repository: repository)
		return MainViewModel(usecase: usecase)
	}()

	// MARK: - Life Cycle

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

	// MARK: - Setup (초기 세팅)

	// MARK: - Binding (ViewModel 바인딩 / 구독)

	// MARK: - UI (뷰 갱신 / 스타일)

	override func setupViewStyle() {}

	// MARK: - Function (기능 로직 / 화면 이동)

	// MARK: - Action (사용자 이벤트)

	@IBAction func didTapButton(_ sender: UIButton) {
		switch sender {
		case moveScreenButton:
			ChangeViewControllerProvider.shared.present(self, toVC: FirstDetailViewController())
		case moveScreenTwoButton:
			ChangeViewControllerProvider.shared.push(self, toVC: FirstDetailViewController())
		case moveScreenThreeButton:
			Task {
				let result = await viewModel.fetchUser(query: "q", page: 2)
				switch result {
				case .success(let response):
					print(response)
				case .failure(let error):
					print(error.description)
				}
			}
		default: break
		}
	}

}
