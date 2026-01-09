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
		fromVC.navigationController?.pushViewController(toVC, animated: true)
	}
	
}
