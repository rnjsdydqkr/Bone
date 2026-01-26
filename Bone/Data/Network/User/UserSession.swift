//
//  UserSession.swift
//  Bone
//
//  Created by 박권용 on 1/22/26.
//

import Foundation
import Alamofire

protocol SessionProtocol {
	func request(_ convertible: URLConvertible,
							 method: HTTPMethod,
							 parameter: Parameters?,
							 headers: HTTPHeaders?) -> DataRequest
}

class UserSession: SessionProtocol {
	private var session: Session
	init() {
		let config = URLSessionConfiguration.default
		config.requestCachePolicy = .returnCacheDataElseLoad
		self.session = Session(configuration: config)
	}
	
	func request(_ convertible: any Alamofire.URLConvertible,
							 method: HTTPMethod,
							 parameter: Parameters?,
							 headers: HTTPHeaders?) -> DataRequest {
		return session.request(convertible, method: method, parameters: parameter, headers: headers)
	}
	
	
}
