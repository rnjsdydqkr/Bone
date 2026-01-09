//
//  PermissionViewController.swift
//  Bone
//
//  Created by 박권용 on 12/29/25.
//

import UIKit
import KYKit

struct DidStartDataAction: Codable {
	var userId = "scv1234"
	var userName = "lion"
}

class PermissionViewController: KYViewController {
	
	@IBOutlet public weak var moveScreenButton: UIButton!
	@IBOutlet public weak var moveScreenTwoButton: UIButton!
	@IBOutlet public weak var moveScreenThreeButton: UIButton!
	
	deinit {
		stopObservation()
	}

	override func viewDidLoad() {
			super.viewDidLoad()
			startObservation()

	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		sendDataObserver()
		
		VCStackDebugger.printRootViewController(label: "[Stack] Permission [RootVC]")
		VCStackDebugger.printNavigationStack(nav: self.navigationController, label: "[Stack] Permission [Navigation]")
		VCStackDebugger.printPresentStack(label: "[Stack] Permission [Present]")
		VCStackDebugger.printVisibleViewController(label: "[Stack] Permission [VisibleVC]")
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

	private func startObservation() {
		NotificationCenter.default.addObserver(self, selector: #selector(didReceivedObserver(_:)), name: .didStartAction, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(didReceivedObserver(_:)), name: .didStartDataAction, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(didReceivedObserver(_:)), name: .didStartDictionaryAction, object: nil)
	}
	
	private func stopObservation() {
		NotificationCenter.default.removeObserver(self, name: .didStartAction, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(didReceivedObserver(_:)), name: .didStartDataAction, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(didReceivedObserver(_:)), name: .didStartDictionaryAction, object: nil)
	}
	
	private func sendDataObserver() {
		NotificationCenter.default.post(name: .didStartAction, object: nil)
		NotificationCenter.default.post(name: .didStartDataAction, object: nil,
																		userInfo: ["isSuccess": true,
																							 "data": "network"])
		let didStartDataAction = DidStartDataAction()
		NotificationCenter.default.post(name: .didStartDictionaryAction, object: nil,
																		userInfo: ["isSuccess": false,
																							 "didStartDataAction": didStartDataAction.dictionary])
	}
	
	@objc private func didReceivedObserver(_ notification: Notification) {
		switch notification.name {
		case .didStartAction:
			print("didStartAction")
		case .didStartDataAction:
			if let dictionary = notification.userInfo {
				let isSuccess = dictionary["isSuccess"] ?? ""
				let data = dictionary["data"] ?? ""
				
				print("didStartDataAction: \(isSuccess), \(data)")
			}
		case .didStartDictionaryAction:
			if let dictionary = notification.userInfo, let didStartData = dictionary["didStartDataAction"] as? [String: Any] {
				let isSuccess = dictionary["isSuccess"] ?? ""
				let userId = didStartData["userId"] as? String ?? ""
				let userName = didStartData["userName"] as? String ?? ""
				
				print("didStartDictionaryAction: \(isSuccess), \(didStartData), \(userId), \(userName)")
			}
		default:
			debugPrint("didReceivedObserver - default")
		}
	}

}
