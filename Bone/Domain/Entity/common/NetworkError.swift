//
//  NetworkError.swift
//  Bone
//
//  Created by 박권용 on 12/23/25.
//

import Foundation

enum NetworkError: Error {
	case urlError
	case invalidResponse
	case failToDecode(String)
	case dataNil
	case serverError(Int)
	case requestFailed(String)
	
	var description: String {
		switch self {
		case .urlError:
			"URL이 올바르지 않습니다."
		case .requestFailed(let message):
			"요청 실패 \(message)"
		case .dataNil:
			"데이터가 없습니다"
		case .failToDecode(let description):
			"디코딩 에러 \(description)"
		case .serverError(let statusCode):
			"서버에러 \(statusCode)"
		case .invalidResponse:
			"응답값이 유효하지 않습니다."
		}
	}
}
