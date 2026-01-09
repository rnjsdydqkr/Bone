//
//  ViewController+Extension.swift
//  Bone
//
//  Created by 박권용 on 1/7/26.
//

import UIKit

public extension UIViewController {
	@objc func handleSwipeGesture() {
		self.dismiss(animated: true)
	}
}
