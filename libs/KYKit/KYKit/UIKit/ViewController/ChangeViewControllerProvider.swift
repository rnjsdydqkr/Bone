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
		toVC.modalPresentationStyle = presentationStyle
		toVC.modalTransitionStyle = transitionStyle
		
		fromVC.present(toVC, animated: true)
	}
	
	public func push(_ fromVC: UIViewController,
									 toVC: UIViewController,
									 animated: Bool? = true) {
		guard let topVC = fromVC.navigationController?.topViewController,
		 type(of: topVC) != type(of: toVC) else { return }
	
//			if let fromVCNaviController = fromVC.navigationController {
//				for controller in fromVCNaviController.viewControllers {
//					if type(of: controller) == type(of: toVC) {
//						fromVC.navigationController?.popToViewController(controller, animated: animated!)
//						return
//					}
//				}
//			}
//			fromVC.navigationController?.pushViewController(toVC, animated: animated!)
	
			if let prevToVC = fromVC.navigationController?.viewControllers.first(where: { type(of: $0) == type(of: toVC) }) {
				fromVC.navigationController?.popToViewController(prevToVC, animated: animated!)
			} else {
				fromVC.navigationController?.pushViewController(toVC, animated: animated!)
			}
	}
	
}
