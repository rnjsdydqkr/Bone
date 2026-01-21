//
//  CoreDataError.swift
//  Bone
//
//  Created by 박권용 on 12/23/25.
//

enum CoreDataError: Error {
	case entityNotFound(String)
	case saveError(String)
	case readError(String)
	case deleteError(String)
	
	var description: String {
		switch self {
		case .entityNotFound(let objectName):
			"객체를 찾을 수 없습니다 \(objectName)"
		case .saveError(let message):
			"객체 저장 에러 \(message)"
		case .readError(let message):
			"객체 조회 에러 \(message)"
		case .deleteError(let message):
			"객체 삭제 에러 \(message)"
		}
	}
}
