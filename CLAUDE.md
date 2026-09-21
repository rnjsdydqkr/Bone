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

- Swift 5.0. 배포 타겟은 앱(Bone) 타겟이 iOS 16.6, `BoneTests` / `BoneUITests`와 프로젝트 레벨은 iOS 26.0이므로 테스트 실행에는 iOS 26 이상 시뮬레이터가 필요합니다.
- 유닛 테스트는 XCTest가 아니라 **Swift Testing**(`import Testing`, `@Test`, `#expect`)을 사용합니다 (`BoneTests/BoneTests.swift`). 현재는 템플릿 스텁 하나만 있습니다.
- Swift Package Manager 의존성 (Xcode가 자동으로 resolve):
  - **Alamofire** 5.11+ — Data 레이어의 Network에서 실제 사용 중입니다.
  - **RxSwift** 6.10+ (RxSwift / RxCocoa / RxRelay / RxBlocking), **SnapKit** 5.7+ — 앱 타겟에 링크만 되어 있고 코드에서 `import`하는 곳은 없습니다. 반응형 처리는 Combine으로 통일하므로 신규 코드에서도 쓰지 않습니다.

## 아키텍처

**Clean Architecture + MVVM**으로 Domain / Data / Presentation 레이어가 명확히 분리됩니다.

```
Domain ← Data → Presentation
```

- **Domain**: 외부 프레임워크 의존 없음. Protocol 정의, Entity, Usecase만 포함.
- **Data**: Domain Protocol의 구현체. Alamofire 기반 Network, Repository, CoreData, UserDefaults.
  - CoreData는 모델(`Bone/Bone.xcdatamodeld`)만 있고 아직 연결되지 않았습니다. `UserRepository`의 `getFavoriteUsers` / `saveFavoriteUsers` / `deleteFavoriteUser`는 `// TODO:` 스텁으로 `.success([])` · `.success(false)`를 그대로 반환합니다.
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
                                            ↓
                                        NetworkManager → SessionProtocol
                                                             ↓
                                                         UserSession (Alamofire Session 래핑)
```

DI 컨테이너는 아직 없습니다. 실제 조립은 ViewController의 프로퍼티 초기화 클로저에서 직접 합니다 (`MainViewController`의 `viewModel` 참고).

```swift
private let viewModel: MainViewModel = {
	let session = UserSession()
	let manager = NetworkManager(session: session)
	let network = UserNetwork(manager: manager)
	let repository = UserRepository(network: network)
	let usecase = UserListUsecase(repository: repository)
	return MainViewModel(usecase: usecase)
}()
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

## Combine MVVM (Input / Output)

ViewModel은 `Bone/Presentation/Common/ViewModel.swift`의 `ViewModel` 프로토콜을 채택합니다.

```swift
@MainActor protocol ViewModel {

	associatedtype Input
	associatedtype Output

	/// 입력 스트림을 받아 출력 스트림으로 바꾼다.
	func transform(input: Input) -> Output
}
```

- **ViewModel**: `@MainActor final class ...: ViewModel`로 선언하고 `Input` / `Output`을 중첩 `struct`로 정의합니다. `Input`의 각 프로퍼티는 `AnyPublisher<_, Never>`이고, 구독 보관용 `Set<AnyCancellable>`은 **ViewModel이 소유**합니다. `transform(input:)` 안에서 `sink`로 구독해 `store(in:)`으로 보관한 뒤 `Output`을 반환합니다.
- **ViewController**: 사용자 이벤트마다 `PassthroughSubject`를 프로퍼티로 두고, `@IBAction`에서는 `send()`만 호출합니다. `bindViewModel()`에서 subject들을 `eraseToAnyPublisher()`로 감싸 `Input`을 조립하고 `viewModel.transform(input:)`을 호출합니다.
- `bindViewModel()`의 **정의는 Binding 섹션**에 두고, **호출은 `viewDidLoad`**(Life Cycle)에서 합니다.
- 반응형 처리는 **Combine으로 통일**합니다. RxSwift는 앱 타겟에 링크만 되어 있을 뿐이므로 신규 코드에서 사용하지 않습니다.
- 레퍼런스 구현: `Bone/Presentation/Splash/SplashViewController.swift` + `Bone/Presentation/Splash/SplashViewModel.swift`.
- **전환 현황**: Splash만 적용 완료입니다. `MainViewModel`은 프로토콜 미채택 + `async` 메서드를 VC가 직접 `await`하는 과도기 형태이고, `Login` / `Permission` / `FirstDetail` / `SecondDetail` / `ThirdDetail` / `FourDetail` ViewModel은 MARK 스켈레톤만 있습니다. 새로 손대는 화면은 위 패턴으로 맞춥니다.

## 주요 컨벤션

- 네트워크 응답은 `async/await` + `Result<T, NetworkError>` 패턴을 사용합니다.
- ViewController ↔ ViewModel 연결은 위 **Combine MVVM (Input / Output)** 패턴을 따릅니다.
- UserDefaults는 `KYUserDefaults`의 `@UserDefault` propertyWrapper를 통해 접근합니다. 직접 `UserDefaults.standard`를 사용하지 않습니다.
- 화면 진입 시 `VCStackDebugger`로 VC 스택을 출력하는 것이 현재 패턴입니다 (SplashViewController 참고).
- 다국어 문자열은 `I18N.swift`를 통해 관리합니다. 각 상수는 `String.localized` 확장(`Bone/resource/common/CommUtil.swift`)을 거칩니다.
- 신규 화면 파일은 `Bone/Presentation/<화면이름>/`에 ViewController와 ViewModel을 나란히 둡니다. 단 기존 파일 중 `PermissionViewController.swift`는 `Presentation/Main/`에, `SecondDetailViewController.swift`는 `Presentation/FirstDetail/`에 있어 폴더와 화면 이름이 어긋난 예외가 있습니다 (파일을 찾을 때 주의).
- 파일 내부의 코드 배치는 아래 **MARK 컨벤션**을 따릅니다.

## MARK 컨벤션 (코드 정렬)

Presentation 레이어의 ViewController / ViewModel은 아래 순서로 MARK 섹션을 두고, 각 멤버를 해당 섹션 안에 배치합니다. Combine 기반 MVVM 전환이 진행 중이므로(Splash 적용 완료), **코드가 아직 없는 섹션도 빈 자리로 남겨둡니다.**

### ViewController

```swift
// MARK: - IBOutlet
// MARK: - Properties                      // viewModel, cancellables
// MARK: - Life Cycle                      // init / deinit / viewDidLoad / viewWillAppear ...
// MARK: - Setup (초기 세팅)                 // delegate 연결, cell register 등
// MARK: - Binding (ViewModel 바인딩 / 구독)  // Combine sink·assign, NotificationCenter 구독
// MARK: - UI (뷰 갱신 / 스타일)              // setupViewStyle() override, 뷰 갱신
// MARK: - Function (기능 로직 / 화면 이동)
// MARK: - Action (사용자 이벤트)             // @IBAction, @objc 터치 핸들러
```

- **API Request / Response 섹션은 VC에 두지 않습니다.** 네트워크 호출과 응답 처리는 ViewModel의 책임입니다.
- `setupViewStyle()`은 `KYViewController.viewWillAppear`에서 자동 호출되므로 Life Cycle이 아니라 **UI** 섹션에 둡니다.
- `VCStackDebugger` 호출 블록은 **Life Cycle**(`viewWillAppear`) 안에 그대로 둡니다.
- 이벤트 전달용 `PassthroughSubject` 프로퍼티는 **Properties**, `bindViewModel()` 정의는 **Binding**, subject의 `send()` 호출은 **Action** 섹션에 둡니다.
- NotificationCenter 관련 메서드(등록 / 해제 / post / 수신)는 Setup·Function으로 쪼개지 말고 **Binding**에 모읍니다. Combine으로 바꿔도 같은 자리에 들어옵니다 (PermissionViewController 참고).
- delegate / dataSource 구현은 파일 하단 extension으로 분리하고, `// MARK: - UITableViewDelegate`처럼 프로토콜 이름을 그대로 씁니다.

### ViewModel

```swift
// MARK: - Input / Output                  // Combine Input / Output 타입 정의
// MARK: - Properties                      // usecase 의존성, Subject / @Published, cancellables
// MARK: - Initializer                     // DI 주입
// MARK: - Binding (Input → Output)        // transform(input:) 등
// MARK: - Function (기능 로직 / 화면 이동)
// MARK: - API Request
// MARK: - API Response
```

- `Input` / `Output` struct는 **Input / Output**, 구독 보관용 `Set<AnyCancellable>`은 **Properties**, `transform(input:)`은 **Binding** 섹션에 둡니다.

### 공통 규칙

- 형식은 `// MARK: - 이름` (하이픈 포함), 섹션 앞뒤로 빈 줄 하나를 둡니다.
- 들여쓰기는 MARK 줄만이 아니라 **파일 전체를 탭**으로 맞춥니다.
- `RootViewControllerProvider` 같은 Presentation 헬퍼는 전체 스켈레톤 대신 실제 멤버가 있는 섹션(`Properties`, `Function`)만 사용합니다.
- Data / Domain 레이어에는 아직 별도 MARK 규칙이 없습니다.
