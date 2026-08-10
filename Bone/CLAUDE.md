# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build & Run

워크스페이스 파일을 사용해야 합니다 (`workspace/Bone-workspace.xcworkspace`). Xcode에서 직접 열거나 아래 명령어를 사용합니다.

```bash
# 빌드
xcodebuild -workspace workspace/Bone-workspace.xcworkspace -scheme Bone -sdk iphonesimulator build

# 테스트
xcodebuild -workspace workspace/Bone-workspace.xcworkspace -scheme Bone -sdk iphonesimulator test

# 특정 테스트만 실행
xcodebuild -workspace workspace/Bone-workspace.xcworkspace -scheme Bone -sdk iphonesimulator test -only-testing:BoneTests/BoneTests
```

- Swift 5.0, iOS 16.6+ (배포 타겟)
- Alamofire: Swift Package Manager로 관리 (Xcode가 자동으로 resolve)

## 아키텍처

**Clean Architecture + MVVM**으로 Domain / Data / Presentation 레이어가 명확히 분리됩니다.

```
Domain ← Data → Presentation
```

- **Domain**: 외부 프레임워크 의존 없음. Protocol 정의, Entity, Usecase만 포함.
- **Data**: Domain Protocol의 구현체. Alamofire 기반 Network, Repository, CoreData, UserDefaults.
- **Presentation**: ViewController + ViewModel (MVVM). KYKit의 `KYViewController`를 베이스 클래스로 사용.

### 의존성 주입 패턴

레이어 간 의존은 항상 Protocol을 통해 이루어집니다.

```
ViewModel → UsecaseProtocol
              ↓
          Usecase → RepositoryProtocol
                       ↓
                   Repository → NetworkProtocol
                                   ↓
                               Network → NetworkManagerProtocol
```

새 기능 추가 시 흐름: `Domain에 Protocol/Entity 정의 → Data에 구현체 → Presentation에 ViewModel/VC 추가`

### 화면 전환

`RootViewControllerProvider.shared.changeRootVC(_:)`로 루트 화면을 전환합니다. `ScreenType` enum (KYKit에 정의)으로 화면을 지정합니다.

VC 간 push/present는 KYKit의 `ChangeViewControllerProvider`를 사용하며, 중복 push와 이미 스택에 있는 VC로의 이동을 자동으로 처리합니다.

## KYKit (로컬 프레임워크)

`libs/KYKit/`에 위치한 자체 제작 프레임워크. `workspace/Bone-workspace.xcworkspace`에 포함되어 있습니다.

- **`KYViewController`**: 모든 VC의 베이스 클래스. swipe-to-dismiss 제스처 기본 탑재. `setupViewStyle()`을 override하여 뷰 스타일 설정.
- **`ScreenType`**: 루트 화면 전환에 쓰이는 enum (`permission` / `login` / `main`).
- **`BuildType`**: 서버 환경 구분 enum (`dev` / `test` / `prod`).
- **`ChangeViewControllerProvider`**: push/present 헬퍼 (중복 방지 로직 내장).

## 주요 컨벤션

- 네트워크 응답은 `async/await` + `Result<T, NetworkError>` 패턴을 사용합니다.
- UserDefaults는 `KYUserDefaults`의 `@UserDefault` propertyWrapper를 통해 접근합니다. 직접 `UserDefaults.standard`를 사용하지 않습니다.
- 화면 진입 시 `VCStackDebugger`로 VC 스택을 출력하는 것이 현재 패턴입니다 (SplashViewController 참고).
- 다국어 문자열은 `I18N.swift`를 통해 관리합니다.
