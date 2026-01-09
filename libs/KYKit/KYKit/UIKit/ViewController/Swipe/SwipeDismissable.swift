//
//  SwipeDismissable.swift
//  KYKit
//
//  Created by 박권용 on 1/7/26.
//

import UIKit

public protocol SwipeDismissable {
	func setupDismissSwipeGesture(direction: UISwipeGestureRecognizer.Direction)
}

public extension SwipeDismissable where Self: UIViewController {
	func setupDismissSwipeGesture(direction: UISwipeGestureRecognizer.Direction = .right) {
		let swipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeGesture))
		swipe.direction = direction
		swipe.view?.addGestureRecognizer(swipe)
	}
}
