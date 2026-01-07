//
//  MainViewController.swift
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

final class MainViewController: KYViewController {
	
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
		
		if let viewControllers = self.navigationController?.viewControllers {
				for (index, vc) in viewControllers.enumerated() {
						print("[Main] [\(index)] \(type(of: vc))")
				}
		}
		
		if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
			 let rootVC = windowScene.windows.first?.rootViewController {
				print("[Main] 현재 루트 뷰 컨트롤러: \(type(of: rootVC))")
		}
	}
	
	override func setupViewStyle() {

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
