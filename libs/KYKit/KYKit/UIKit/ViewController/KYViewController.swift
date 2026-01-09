//
//  KYViewController.swift
//  KYKit
//
//  Created by 박권용 on 12/23/25.
//

import UIKit

open class KYViewController: UIViewController, SwipeDismissable {

    open override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupViewStyle()
    }
    
    open func setupViewStyle() {}
    
}
