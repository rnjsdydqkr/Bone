//
//  Codable+Extension.swift
//  Bone
//
//  Created by 박권용 on 12/26/25.
//

import Foundation

extension Encodable {
	subscript(key: String) -> Any? {
		return dictionary[key]
	}
	var dictionary: [String: Any] {
		return (try? JSONSerialization.jsonObject(with: JSONEncoder().encode(self)) as? [String: Any]) ?? [:]
	}
}
