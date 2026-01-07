//
//  MainViewController.swift
//  Bone
//
//  Created by 박권용 on 12/29/25.
//

import UIKit
import KYKit

final class MainViewController: KYViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		VCStackDebugger.printNavigationStack(label: "Main")
		VCStackDebugger.printRootViewController(nav: self.navigationController, label: "Main")
	}
	
	override func setupViewStyle() {

	}

}
