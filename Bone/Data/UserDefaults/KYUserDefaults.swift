//
//  KYUserDefaults.swift
//  Bone
//
//  Created by 박권용 on 12/29/25.
//

import Foundation

struct KYUserDefaults {
	let defaults = UserDefaults.standard

	func savedString() {
		defaults.set("Gemini", forKey: "username")
	}
	func savedInt() {
		defaults.set(25, forKey: "age")
	}
	func savedBool() {
		defaults.set(true, forKey: "isDarkMode")
	}
	
	func loadString() -> String {
		defaults.string(forKey: "username") ?? ""
	}
	func loadInt() -> Int {
		defaults.integer(forKey: "age")
	}
	func loadBool() -> Bool {
		defaults.bool(forKey: "isDarkMode")
	}
	
	let favorites = ["Apple", "Banana", "Orange"]
	func savedArray() {
		defaults.set(favorites, forKey: "favoriteFruits")
	}
	func loadArray() -> [String] {
		if let savedFruits = defaults.stringArray(forKey: "favoriteFruits") {
			return savedFruits
		} else {
			return []
		}
	}
	let settings: [String: Any] = ["fontSize": 14, "fontName": "Protendard"]
	func savedDictionary() {
		defaults.set(settings, forKey: "appSettings")
	}
	func loadDictionary() -> Dictionary<String, Any> {
		if let savedSettings = defaults.dictionary(forKey: "appSettings") {
			return savedSettings
		} else {
			return [:]
		}
	}
}

