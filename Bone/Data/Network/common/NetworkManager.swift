//
//  NetworkManager.swift
//  Bone
//
//  Created by 박권용 on 1/22/26.
//

import Foundation
import Alamofire

protocol NetworkManagerProtocol {
	func fetchData<T: Decodable>(url: String, method: HTTPMethod, parameters: Parameters?) async -> Result<T, NetworkError>
}

class NetworkManager: NetworkManagerProtocol {
	private let session: SessionProtocol
	init(session: SessionProtocol) {
		self.session = session
	}
	
	private let tokenHeader = HTTPHeaders()
	
	func fetchData<T>(url: String, method: Alamofire.HTTPMethod, parameters: Alamofire.Parameters?) async -> Result<T, NetworkError> where T : Decodable {
		guard let url = URL(string: url) else {
			return .failure(.urlError)
		}
		
		let result = await session.request(url, method: method, parameter: parameters, headers: tokenHeader).serializingData().response
		switch result.result {
		case .success(let data):
			guard let response = result.response else { return .failure(.invalidResponse) }
			if 200..<400 ~= response.statusCode {
				do {
					let decodedData = try JSONDecoder().decode(T.self, from: data)
					return .success(decodedData)
				} catch {
					return .failure(.failToDecode(error.localizedDescription))
				}
			} else {
				return .failure(.serverError(response.statusCode))
			}
		case .failure(let error):
			return .failure(.requestFailed(error.localizedDescription))
		}
		
//		let result = await session.request(url, method: method, parameter: parameters, headers: tokenHeader).serializingData().response
//		if let error = result.error { return .failure(.requestFailed(error.localizedDescription)) }
//		guard let data = result.data else { return .failure(.dataNil) }
//		guard let response = result.response else { return .failure(.invalidResponse) }
//		if 200..<400 ~= response.statusCode {
//			do {
//				let decodedData = try JSONDecoder().decode(T.self, from: data)
//				return .success(decodedData)
//			} catch {
//				return .failure(.failToDecode(error.localizedDescription))
//			}
//		} else {
//			return .failure(.serverError(response.statusCode))
//		}
		
		
	}
	
	
}
