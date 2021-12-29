/* 옵셔널 추출 */

/*
    열거형의 some 케이스로 꼭꼭 숨어있는 옵셔널의 값을 옵셔널이 아닌 값으로 추출하는
    옵셔널 추출 방법에 대해 알아보겠습니다.
*/

import Swift

 
//MARK: 강제 추출
/*
    - 옵셔널 강제 추출 방식은 옵셔널의 값을 추출하는 가장 간단하지만 가장 위험한 방법입니다.
    - 런타입 오류가 일어날 가능성이 가장 높기 때문입니다
    - 또, 옵셔널을 만든 의미가 무색해지는 방법이기도 합니다.
    - 옵셔널의 값을 강제 추출하려면 옵셔널 값의 뒤에 느낌표(!)를 붙여주면 값을 강제로 추출하여 반환해줍니다.
    - 만약 강제 추출 시 옵셔널에 값이 없다면, 즉 nil이라면 런타임 오류가 발생합니다.
*/


//MARK: Optional Binding

/*
    - 옵셔널 바인딩은 옵셔널에 값이 있는지 확인할 때 사용합니다.
    - 만약 옵셔널에 값이 있다면 옵셔널에서 추출한 값을 일정 블록 안에서 사용할 수 있는 상수나 변수로
      할당해서 옵셔널이 아닌 형태로 사용할 수 있도록 해줍니다.
    - 옵셔널 바인딩은 if 또는 while 구문 등과 결합하여 사용할 수 있습니다.
*/

func printName(_ name: String) {
    print(name)
}

var myName: String? = nil

//printName(myName)
// 전달되는 값의 타입이 다르기 때문에 컴파일 오류발생

if let name: String = myName {
    printName(name)
} else {
    print("myName == nil")
}


var yourName: String! = nil

if let name: String = yourName {
    printName(name)
} else {
    print("yourName == nil")
}

// name 상수는 if-let 구문 내에서만 사용가능합니다
// 상수 사용범위를 벗어났기 때문에 컴파일 오류 발생
//printName(name)

// ,를 사용해 한 번에 여러 옵셔널을 바인딩 할 수 있습니다
// 모든 옵셔널에 값이 있을 때만 동작합니다
myName = "willer"
yourName = nil

if let name = myName, let friend = yourName {
    print("\(name) and \(friend)")
}
// yourName이 nil이기 때문에 실행되지 않습니다

yourName = "hana"

if let name = myName, let friend = yourName {
    print("\(name) and \(friend)")
}
// yagom and hana


//MARK: Force Unwrapping

printName(myName!) // yagom

myName = nil

//print(myName!)
// 강제추출시 값이 없으므로 런타임 오류 발생

yourName = nil

//printName(yourName)
// nil 값이 전달되기 때문에 런타임 오류발생

