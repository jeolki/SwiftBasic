/* 데이터 타입 고급 */

import UIKit

//MARK: 열거형(Enum)

/*
    - 열거형은 연관된 항목들을 묶어서 표현할 수 있는 타입
    - 열거형은 배열이나 딕셔너리 같은 타입과 다르게 프로그래머가 정의해준 항목 값 외에는 추가/수정이 불가
    - 정해진 값만 열거형 값에 속할 수 있다.
    
    * 열거형을 사용하는 경우
    - 제한된 선택지를 주고 싶을 때
    - 정해진 값 외에는 입력받고 싶지 않을 때
    - 예상된 입력 값이 한정되어 있을 때
 
    ** 열거형과 옵셔널
    - 스위프트의 주요 기능 중 하나인 옵셔널은 enum(열거형)으로 구현되어 있습니다.
*/

/*
    * 기본 열거형
    - 스위프트의 열거형은 enum이라는 키워드로 선언할 수 있습니다.
    - enum은 타입이므로 대문자 카멜케이스를 사용하여 이름을 정의합니다
    - 각 case는 소문자 카멜케이스로 정의합니다
    - 각 case는 그 자체가 고유의 값입니다

     enum <#이름#> {
         case <#이름1#>
         case <#이름2#>
         case <#이름3#>, <#이름4#>, <#이름5#>
         ...
     }
*/

enum Weekday {
    case mon
    case tue
    case wed
    case thu, fri, sat, sun
}

var day: Weekday = Weekday.mon
day = .tue

print(day) // tue

switch day {
case .mon, .tue, .wed, .thu:
    print("평일입니다")
case Weekday.fri:
    print("불금 파티!!")
case .sat, .sun:
    print("신나는 주말!!")
}
// 평일입니다

/*
    * 원시 값
    - 열거형의 각 항목은 자체로도 하나의 값이지만 항목의 원시 값(Raw Value)도 가질 수 있습니다.
    - 특정 타입으로 지정된 값을 가질 수 있다는 뜻
    - 특정 타입의 값을 원시 값으로 가지고 싶다면 열거형 이름 오른쪽 타입을 몇시해주면 됩니다.
    - C 언어의 enum처럼 정수값을 가질 수도 있습니다
    - rawValue를 사용하면 됩니다
    - case별로 각각 다른 값을 가져야합니다
*/

enum Fruit: Int {
    case apple = 0
    case grape = 1
    case peach
    //    case mango = 0
}

print("Fruit.peach.rawValue == \(Fruit.peach.rawValue)")
// Fruit.peach.rawValue == 2

//정수 타입 뿐만 아니라 Hashable 프로토콜을 따르는 모든 타입이 원시값의 타입으로 지정될 수 있습니다

enum School: String {
    case elementary = "초등"
    case middle = "중등"
    case high = "고등"
    case university
}

print("School.middle.rawValue == \(School.middle.rawValue)")
// School.middle.rawValue == 중등

print("School.university.rawValue == \(School.university.rawValue)")
// School.university.rawValue == university


/*
    * 원시값을 통한 초기화
    - rawValue를 통해 초기화 할 수 있습니다
    - rawValue가 case에 해당하지 않을 수 있으므로
    - rawValue를 통해 초기화 한 인스턴스는 옵셔널 타입입니다
*/

//let apple: Fruit = Fruit(rawValue: 0)
let apple: Fruit? = Fruit(rawValue: 0)

if let orange: Fruit = Fruit(rawValue: 5) {
    print("rawValue 5에 해당하는 케이스는 \(orange)입니다")
} else {
    print("rawValue 5에 해당하는 케이스가 없습니다")
} // rawValue 5에 해당하는 케이스가 없습니다


/*
   * 메서드
*/

enum Month {
    case dec, jan, feb
    case mar, apr, may
    case jun, jul, aug
    case sep, oct, nov
    
    func printMessage() {
        switch self {
        case .mar, .apr, .may:
            print("따스한 봄~")
        case .jun, .jul, .aug:
            print("여름 더워요~")
        case .sep, .oct, .nov:
            print("가을은 독서의 계절!")
        case .dec, .jan, .feb:
            print("추운 겨울입니다")
        }
    }
}

Month.mar.printMessage()
// 따스한 봄~

/*
    * 연관 값
    - 스위프트의 열거형 각 항목이 연관 값을 가지게 되면, 기존 프로그래밍 언어의 공용체 형태를 띌 수도 있습니다.
    - 열거형 내의 항목(case)이 자신과 연관된 값을 가질 수 있습니다
    - 연관 값은 각 항목 옆에 소괄호로 묶어 표현할 수 있습니다.
    - 다른 항목이 연관 값을 갖는다고 모든 항목이 연관 값을 가질 필요는 없습니다.
*/

enum mainDish {
    case pasta(taste: String)
    case pizza(dough: String, topping: String)
    case chicken(withSauce: Bool)
    case rice
}

var dinner: mainDish = mainDish.pasta(taste: "크림")
dinner = .pizza(dough: "치즈크러스트", topping: "불고기")
dinner = .chicken(withSauce: true)
dinner = .rice

/*
    * 항목 순회
    - 열거형에 포함된 모든 케이스를 알아야 할 때
    - 열거형의 이름 뒤에 콜론(:)을 작성하고 CaseIterable 프로토콜을 채택합니다.
    - allCases라는 이름의 타입 프로퍼티를 통해 모든 케이스의 컬렉션을 생성합니다.
*/

enum Schools: CaseIterable {
    case primary
    case elementary
    case middle
    case high
    case college
    case university
    case graduate
}

let allCases: [Schools] = Schools.allCases
print(allCases)

/*
    * 순환 열거형
    - 열거형 항목의 연관 값이 열거형 자신의 값이고자 할 때
    - 순환 열겨형을 명시하고 싶다면 indirect 키워드 사용
    - 특정 항목에만 한정하고 싶다면 case 키워드 앞에 indirect를 붙인다.
    - 열거형 전체에 적용하고 싶다면 enum 키워드 앞에 indirect를 붙인다.
*/

// 특정 항목
enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}

// 전체
indirect enum ArithmeticExpression2 {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let final = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

// 계산을 위한 순환 함수
func evalute(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case .number(let value):
        return value
    case .addition(let left, let right):
        return evalute(left) + evalute(right)
    case .multiplication(let left, let right):
        return evalute(left) * evalute(right)
    }
}

let result: Int = evalute(final)
print("(5 + 4) * 2 = \(result) ")
