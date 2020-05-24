# [iOS X Design] Project

## 조원

- 이주혁
- 류세화
- 김태훈
- 이유진

> ## <Branch 생성 방법>
>
> 1. 먼저 저장소의 링크로 git clone을 받습니다 !  
>    git clone https://github.com/SOPT26-iOS-X-Design/iOS-Design-Project.git
>
> 2. 이제 로컬 저장소 안에서 브랜치를 생성합니다.  
>    git checkout -b [자기브랜치 이름]
>
> 3. 원격 저장소와 로컬 브랜치 저장소를 연결시켜 줍니다.  
>    git push -u origin [자기 브랜치 이름]

## 1. 변경된 프로젝트로 받기

> 🚨🚨🚨충돌 주의🚨🚨🚨  
> 충돌이 나는게 어찌보면 당연할 수도 있습니다 !!  
> 충돌이 나면 저에게 말해주세요 !!!  
> main 스토리보드에서 다른 작업을 하셨다면 충돌이 날 우려가 매우매우 높습니다.  
>  따라서 main 에서 한 작업을 꼭 따로 저장해 주세요!!

> 🚨🚨🚨 브랜치를 이동하기 전에는 꼭 현재 브랜치에서 commit까지 완료한 뒤에 이동해주세요 ,,!!  
> 안그러면 작업한게 고대로 다른 브랜치로 이동하게 됩니다 .!!!!

> 🚨🚨🚨매우 중요 !!  
> 현재 본인 브랜치에서 한 작업을 꼭 백업해 주세요 .. !  
> 마스터 브랜치에서 프로젝트를 아예 새로 만들었기 때문에 합치는 과정에서 본인이 한 작업이 모두 날라갈 확률이 매우매우 높습니다.  
> 꼭 본인 브랜치에 있는 프로젝트를 따로 백업한 다음 작업을 진행하시는걸 권장드립니다 !!!!  
> 제가 처음에 프로젝트를 이상하게 파는 바람에 다시파게 되었네요 .. 죄송합니다 ㅠㅜ

1. master 브랜치로 체크아웃 하기  
   git chechout master

2. 원격 저장소에 있는 파일과 동기화 시키기
   git pull origin master

3. 내 브랜치로 다시 이동
   git checkout [자기브랜치이름]

4. 내 브랜치를 master 브랜치와 동기화 시키기  
   git merge master

## 2. 자신이 작업한 탭바와 연결시키기 !

현재 탭바는 따로 컨트롤러를 생성해서 연결을 해 두었습니다.
따라서 자기가 작업한 탭바와 연결하는 법을 알려드리겠습니다.

먼저 Source/ViewControllers 폴더 안에 TabBarController 라는 파일을 찾습니다.

이 컨트롤러에는 각 뷰를 탭바 컨트롤러와 연결시켜두는 코드가 존재하게 됩니다. 이제 여기서 자신이 작업한 뷰와 연결시켜 주겠습니다. 예시로 Home 탭 을 연결시키는 코드를 보여드리겠습니다.

```swift
let homeStoryboard = UIStoryboard.init(name: "HomeExample", bundle: nil)
// 자신이 작업한 스토리 보드 파일 불러오기
guard let thirdTab = homeStoryboard.instantiateViewController(identifier: "HomeExVC")
    as? HomeExVC  else {
    return
}
// 스토리 보드에서 원하는 작업할 뷰컨트롤러 불러오기

thirdTab.tabBarItem.title = ""
 // 각 탭에 표시할 타이틀
thirdTab.tabBarItem.image = UIImage.init(systemName: "house")
// 각 탭에 표시할 이미지
thirdTab.tabBarItem.selectedImage = UIImage(named: "iconHomeSelected")?.withRenderingMode(.alwaysOriginal)
// 각 탭이 선택되었을때 사용할 이미지
// 여기서 withRenderingMode는 이제 이미지를 불러올때 xcode는 사용할 이미지를 렌더링해서 좀더 사용하기 편하게 만들어 주는데, 렌더링을 하지 않고 원하는 이미지 자체의 색상을 쓰고싶을 때 다음과 같이 .alwaysOriginal 모드로 설정해 줄 수 있다.


let tabs =  [firstTab, secondTab, thirdTab, fourthTab, fifthTab]
// 탭을 구성할 뷰컨 배열을 생성하여
self.setViewControllers(tabs, animated: false)
// self(TabBarController)에 적용시킬수 있다.
self.selectedViewController = thirdTab
// 처음으로 표시될 탭을 지정할 수도 있다.
```
