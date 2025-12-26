//
//  Font.swift
//  KYKit
//
//  Created by 박권용 on 12/26/25.
//

import UIKit

extension UIFont {
	public static func font(fontName: FontTypes, size: CGFloat) -> UIFont {
		UIFont(name: fontName.name, size: size) ?? UIFont.systemFont(ofSize: 17)
	}
}
