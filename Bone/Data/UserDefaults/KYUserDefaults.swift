//
//  KYUserDefaults.swift
//  Bone
//
//  Created by 박권용 on 12/29/25.
//

import Foundation

protocol AnyOptional {
	var isNil: Bool { get }
}
extension Optional: AnyOptional {
	var isNil: Bool { self == nil }
}

@propertyWrapper
struct UserDefault<Value> {
	let key: String
	var container = UserDefaults.standard
	
	var wrappedValue: Value? {
		get {
			container.object(forKey: key) as? Value
		}
		set {
			if let optional = newValue as? AnyOptional, optional.isNil {
				container.removeObject(forKey: key)
			} else {
				container.set(newValue, forKey: key)
			}
		}
	}
}

struct KYUserDefaults {
	static var standard = KYUserDefaults()
	
	let defaults = UserDefaults.standard

	@UserDefault(key: "user_name")
	var userName: String?
	@UserDefault(key: "age")
	var age: Int?
	@UserDefault(key: "is_dark_mode")
	var isDarkMode: Bool?
	@UserDefault(key: "favorite_fruits")
	var favoriteFruits: [String]?
	@UserDefault(key: "app_settings")
	var appSettings: [String: Any]?
	
	func removeObject(_ key: String) {
		defaults.removeObject(forKey: key)
	}
}

