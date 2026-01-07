//
//  LoginViewController.swift
//  Bone
//
//  Created by 박권용 on 12/29/25.
//

import UIKit
import KYKit

class LoginViewController: KYViewController {
	
		@IBOutlet private weak var titleLabel: UILabel!
		@IBOutlet private weak var subTitleLabel: UILabel!
		
		@IBOutlet private weak var confirmButton: UIButton!
		@IBOutlet private weak var cancelButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
			
			VCStackDebugger.printNavigationStack(label: "Login")
			VCStackDebugger.printRootViewController(nav: self.navigationController, label: "Login")
    }
	
		override func setupViewStyle() {

		}

}
