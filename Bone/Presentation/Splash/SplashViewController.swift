//
//  ViewController.swift
//  Bone
//
//  Created by 박권용 on 12/19/25.
//

import UIKit
import KYKit

class SplashViewController: KYViewController {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subTitleLabel: UILabel!
    
    @IBOutlet private weak var confirmButton: UIButton!
    @IBOutlet private weak var cancelButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupViewStyle() {
			titleLabel.font = UIFont(name: FontStyle.AmericanTypewriterBold.name, size: 20)
			subTitleLabel.font = UIFont(name: FontStyle.JetBrainsMonoBold.name, size: 20)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

}

