//
//  MoveScreen.swift
//  KYKit
//
//  Created by 박권용 on 1/9/26.
//

import UIKit

public class ChangeViewControllerProvider {
	public static let shared = ChangeViewControllerProvider()
	
	public func present(_ fromVC: UIViewController,
							 toVC: UIViewController,
							 animated: Bool? = true,
							 presentationStyle: UIModalPresentationStyle = .fullScreen,
							 transitionStyle: UIModalTransitionStyle = .crossDissolve) {
		var currentVC = fromVC
		
		if fromVC.presentedViewController != nil {
			guard let currentPresentedVC = fromVC.presentedViewController, type(of: currentPresentedVC) != type(of: toVC) else { return }
		}
		
		while let presentingVC = currentVC.presentingViewController {
			if type(of: presentingVC) == type(of: toVC) {
				presentingVC.dismiss(animated: true, completion: nil)
				return
			}
			currentVC = presentingVC
		}
		
		toVC.modalPresentationStyle = presentationStyle
		toVC.modalTransitionStyle = transitionStyle
		fromVC.present(toVC, animated: true)
	}
	
	public func push(_ fromVC: UIViewController,
									 toVC: UIViewController,
									 animated: Bool? = true) {
		guard let topVC = fromVC.navigationController?.topViewController,
		 type(of: topVC) != type(of: toVC) else { return }
	
			if let prevToVC = fromVC.navigationController?.viewControllers.first(where: { type(of: $0) == type(of: toVC) }) {
				fromVC.navigationController?.popToViewController(prevToVC, animated: animated!)
			} else {
				fromVC.navigationController?.pushViewController(toVC, animated: animated!)
			}
	}
	
}
