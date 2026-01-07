//
//  FirstDetailViewModel.swift
//  Bone
//
//  Created by 박권용 on 1/7/26.
//

import UIKit

final class FirstDetailViewModel {
	
	func makeFirstDetailVC() -> UIViewController {
		// 1. 이동할 VC의 인스턴스 생성 (XIB 파일명과 클래스명이 같아야 함)
		let detailVC = FirstDetailViewController(nibName: "FirstDetailViewController", bundle: nil)

		// 2. 화면 표시 스타일 설정 (옵션)
		detailVC.modalPresentationStyle = .fullScreen // 전체화면
		detailVC.modalTransitionStyle = .crossDissolve

		return detailVC
	}
	
	func makeSecondDetailVC() -> UIViewController {
		// 1. 이동할 VC 인스턴스 생성
		let secondDetailVC = SecondDetailViewController(nibName: "SecondDetailViewController", bundle: nil)

		return secondDetailVC
	}
	
	func makeThirdDetailVC() -> UIViewController {
		// 1. 이동할 VC의 인스턴스 생성 (XIB 파일명과 클래스명이 같아야 함)
		let detailVC = ThirdDetailViewController(nibName: "ThirdDetailViewController", bundle: nil)

		// 2. 화면 표시 스타일 설정 (옵션)
		detailVC.modalPresentationStyle = .fullScreen // 전체화면
		detailVC.modalTransitionStyle = .crossDissolve

		return detailVC
	}
	
	func makeFourDetailVC() -> UIViewController {
		// 1. 이동할 VC의 인스턴스 생성 (XIB 파일명과 클래스명이 같아야 함)
		let detailVC = FourDetailViewController(nibName: "FourDetailViewController", bundle: nil)

		// 2. 화면 표시 스타일 설정 (옵션)
		detailVC.modalPresentationStyle = .fullScreen // 전체화면
		detailVC.modalTransitionStyle = .crossDissolve

		return detailVC
	}
	
}
