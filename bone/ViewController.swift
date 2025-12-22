//
//  ViewController.swift
//  bone
//
//  Created by 박권용 on 12/19/25.
//

import UIKit
import KYKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(SharedData.shared.getAppversion())
    }


}

