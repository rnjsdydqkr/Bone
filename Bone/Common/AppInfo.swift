//
//  AppInfo.swift
//  Bone
//
//  Created by 박권용 on 12/26/25.
//

import Foundation

struct AppInfo: Codable {
	static var appVrsn: String {
		guard let dictionary = Bundle.main.infoDictionary, let version = dictionary["CFBundleShortVersionString"] as? String else { return "" }
		return version
	}
	static var appBuild: String {
		guard let dictionary = Bundle.main.infoDictionary, let build = dictionary["CFBundleVersion"] as? String else { return "" }
		return build
	}
}
