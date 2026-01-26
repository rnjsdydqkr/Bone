//
//  TopicSession.swift
//  Bone
//
//  Created by 박권용 on 1/26/26.
//

import Foundation
import Alamofire

class TopicSession: SessionProtocol {
	private var session: Session
	init() {
		let config = URLSessionConfiguration.default
		config.requestCachePolicy = .reloadIgnoringCacheData
		self.session = Session(configuration: config)
	}
	
	func request(_ convertible: any URLConvertible,
							 method: HTTPMethod,
							 parameter: Parameters?,
							 headers: HTTPHeaders?) -> DataRequest {
		return session.request(convertible, method: .get, parameters: parameter, headers: headers)
	}
	
	
}
