//
//  ViewModel.swift
//  Bone
//
//  Created by 박권용 on 9/17/26.
//

import Foundation

@MainActor protocol ViewModel {

	associatedtype Input
	associatedtype Output

	/// 입력 스트림을 받아 출력 스트림으로 바꾼다.
	func transform(input: Input) -> Output
}
