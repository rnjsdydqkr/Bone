
//
//  BuildType+Enum.swift
//  KYKit
//
//  Created by 박권용 on 12/26/25.
//

import Foundation

public enum BuildType {
	case dev, test, prod
	
	public var name: String {
		switch self {
		case .dev: "dev"
		case .test: "test"
		case .prod: "prod"
		}
	}
	
	public var url: String {
		switch self {
		case .dev: "http://swiftapi.rubypaper.co.kr:2029"
		case .test: "http://swiftapi.rubypaper.co.kr:2029"
		case .prod: "https://api.themoviedb.org"
		}
	}
	
}
