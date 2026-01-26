//
//  Session+Protocol.swift
//  Bone
//
//  Created by 박권용 on 1/26/26.
//

import Alamofire

protocol SessionProtocol {
	func request(_ convertible: URLConvertible,
							 method: HTTPMethod,
							 parameter: Parameters?,
							 headers: HTTPHeaders?) -> DataRequest
}
