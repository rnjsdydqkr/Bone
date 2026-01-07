//
//  LaunchType+Enum.swift
//  KYKit
//
//  Created by 박권용 on 12/29/25.
//

import Foundation

public enum ScreenType {
	case permission
	case login
	case main
	
	public var nibName: String {
		switch self {
		case .permission: "PermissionViewController"
		case .login: "LoginViewController"
		case .main: "MainViewController"
		}
	}
}
