/* 흐름제어 - 조건문 */

import Swift

//MARK: if 구문

/*
    - if, else 등의 키워드를 사용하여 구현
    - 스위프트의 if 구문은 조건의 값이 꼭 Bool 타입이어야 한다.
    - else if는 몇 개가 이어져도 상관없으며 else 블록은 없어도 상관없다.
    
    if <#condition#> {
       <#statements#>
    } else if <#condition#> {
       <#statements#>
    } else {
       <#statements#>
    }
*/

let someInteger = 100

if someInteger < 100 {
    print("100 미만")
} else if someInteger > 100 {
    print("100 초과")
} else {
    print("100")
} // 100

// 스위프트의 조건에는 항상 Bool 타입이 들어와야합니다
// someInteger는 Bool 타입이 아닌 Int 타입이기 때문에

//컴파일 오류가 발생합니다
//if someInteger { }


//MARK: swifch 구문

/*
    - switch 구문의 소괄호(())를 생략 가능
    - break 키워드 사용은 선택 사항
    - case 내부의 코드를 모두 실행하면 break 없이도 switch 구문이 종료된다
    - 스위프트에서 switch 구문의 case를 연속 실행하려면 fallthrough 키워드를 사용
 
    - switch 구문의 조건에 다양한 값이 들어갈 수 있습니다
    - 다만 각 case에 들어갈 비교 값은 입력 값과 데이터 타입이 같아야 한다
    - 비교될 값이 명확히 한정적인 값(열거형 값 등)이 아닐 때는 default를 꼭 작성한다.
    - 각 case 에는 범위 연산자를 사용할 수도, where 절을 사용하여 조건을 확장할 수도 있습니다.
     
    switch <#value#> {
    case <#pattern#>:
         <#code#>
    case <#pattern#>:
         <#code#>
         // 이번 case를 마치고 switch 구문을 탈출하지 않습니다. 아래 case로 넘어갑니다.
         fallthrough
    case <#pattern#>, <#pattern#>, <#pattern#> : // 한 번에 여러 값과 비교할 수 있습니다.
         <#code#>
         break // break 키워드를 통한 종료는 선택 사항입니다.
    default:   // 한정된 범위가 명확지 않다면 default는 필수입니다.
         <#code#>
    }
    
    - case XXX: 다음에는 꼭 실행 가능한 코드가 위치해야 합니다.
*/

// 범위 연산자를 활용하면 더욱 쉽고 유용합니다
switch someInteger {
case 0:
    print("zero")
case 1..<100:
    print("1~99")
case 100:
    print("100")
case 101...Int.max:
    print("over 100")
default:
    print("unknown")
} // 100

// 정수 외의 대부분의 기본 타입을 사용할 수 있습니다
switch "willer" {
case "jake":
    print("jake")
case "mina":
    print("mina")
case "willer":
    print("willer!!")
default:
    print("unknown")
} // yagom!!


/*
    - 스위프트 5.0 버전에서 추가된 unknown이라는 속성을 사용하여 유려하게 대처 가능합니다.
      case default: 는 case _: 로 표한 할 수 있습니다. (와일드카드 case(case _))
      @unknown case _: 로 unknown 속성을 사용합니다.
 
    - 논리적 오류에 대해 도음을 받을 수 있는 unknown 속성을 부여할 수 있는 case는
      case _ 혹은 case default case 뿐입니다.
    - 또, unknown 속성을 부여한 case switch 구문의 마지막 case로 작성해야 합니다.
*/

enum Menu {
    case chicken
    case pizza
    case hamburger
}

let lunchMenu: Menu = .chicken

switch lunchMenu {
case .chicken:
    print("반반 무많이")
case .pizza:
    print("핫소스 많이 주세요")
@unknown case _:
    print("오늘 메뉴가 뭐죠?")
}


