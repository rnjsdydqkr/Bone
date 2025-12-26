//
//  ViewController.swift
//  Bone
//
//  Created by 박권용 on 12/19/25.
//

import UIKit
import KYKit

final class SplashViewController: KYViewController {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subTitleLabel: UILabel!
    
    @IBOutlet private weak var confirmButton: UIButton!
    @IBOutlet private weak var cancelButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupViewStyle() {
			titleLabel.font = .font(fontName: .AppleSDGothicNeoBold, size: 20)
			subTitleLabel.font = .font(fontName: .JetBrainsMonoBold, size: 20)
			
			print(BuildType.test)
//			print(BuildType.dev.name)
			print(BuildType.dev.url)
			
			print(BuildType.prod.url)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

}

