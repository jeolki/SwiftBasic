/* 구조체와 클래스 */

import Swift

//MARK: 클래스

/*
    * 클래스 정의
    - 클래스를 정의할 때는 class라는 키워드를 사용합니다.
    
    class <#이름#> {
       /* <#구현부#> */
    }
 
    ** 클래스 명명법
    - 클래스를 정의한다는 것은 새로운 타입을 생성해주는 것과 마찬가지므로 기본 타입 이름(Int, String)처럼
      대문자 카멜케이스를 사용하여 이름을 지어줍니다. 프로퍼티와 메서드는 소문자 카멜케이스를 사용하여 이름을
      지어줍니다.
*/

class Person {
    var height: Float = 0.0
    var weight: Float = 0.0
}


//MARK: 프로퍼티 및 메서드

/*
    * 클래스 인스턴스의 생성과 초기화
    - 클래스를 정의한 후, 인스턴스를 생성하고 초기화하고자 할 때는 기본적인 이니셜라이저를 사용합니다.
    
    ** 인스턴스와 객체
    - 흔히 다른 프로그래밍 언어에서는 클래스의 인스턴스를 객체라고 부릅니다.
    - 물론 스위프트에서 객체라고 부르는 것이 틀린 것이 아니지만, 공식 문서에는 인스턴스라는 용어를 사용합니다.
 
    - 인스턴스가 생성되고 초기화된 후(이니셜라이즈된 후) 프로퍼티 값에 접근하고 싶다면 마침표(.)를 사용합니다.
    - 구조체와는 다르게 클래스의 인스턴스는 참조 타입이므로 클래스의 인스턴스를 상수 let으로 선언해도
      내부 프로퍼티 값을 변경할 수 있습니다.
*/

class Sample {
    // 가변 프로퍼티
    var mutableProperty: Int = 100
    
    // 불변 프로퍼티
    let immutableProperty: Int = 100
    
    // 타입 프로퍼티
    static var typeProperty: Int = 100
    
    // 인스턴스 메서드
    func instanceMethod() {
        print("instance method")
    }
    
    // 타입 메서드
    // 재정의 불가 타입 메서드 - static
    static func typeMethod() {
        print("type method - static")
    }
    
    // 재정의 가능 타입 메서드 - class
    class func classMethod() {
        print("type method - class")
    }
}


//MARK: 클래스 사용

// 인스턴스 생성 - 참조정보 수정 가능
var mutableReference: Sample = Sample()

mutableReference.mutableProperty = 200

// 불변 프로퍼티는 인스턴스 생성 후 수정할 수 없습니다
// 컴파일 오류 발생
//mutableReference.immutableProperty = 200


// 인스턴스 생성 - 참조정보 수정 불가
let immutableReference: Sample = Sample()

// 클래스의 인스턴스는 참조 타입이므로 let으로 선언되었더라도
// 인스턴스 프로퍼티의 값 변경이 가능합니다
immutableReference.mutableProperty = 200

// 다만 참조정보를 변경할 수는 없습니다
// 컴파일 오류 발생
//immutableReference = mutableReference

// 참조 타입이라도 불변 인스턴스는
// 인스턴스 생성 후에 수정할 수 없습니다
// 컴파일 오류 발생
//immutableReference.immutableProperty = 200


// 타입 프로퍼티 및 메서드
Sample.typeProperty = 300
Sample.typeMethod() // type method

// 인스턴스에서는 타입 프로퍼티나 타입 메서드를
// 사용할 수 없습니다
// 컴파일 오류 발생
//mutableReference.typeProperty = 400
//mutableReference.typeMethod()


//MARK: 학생 클래스

class Student {
    // 가변 프로퍼티
    var name: String = "unknown"
    
    // 키워드도 `로 묶어주면 이름으로 사용할 수 있습니다
    var `class`: String = "Swift"
    
    // 타입 메서드

    class func selfIntroduce() {
        print("학생타입입니다")
    }
    
    // 인스턴스 메서드
    // self는 인스턴스 자신을 지칭하며, 몇몇 경우를 제외하고 사용은 선택사항입니다
    func selfIntroduce() {
        print("저는 \(self.class)반 \(name)입니다")
    }
}

// 타입 메서드 사용
Student.selfIntroduce() // 학생타입입니다

// 인스턴스 생성
var yagom: Student = Student()
yagom.name = "willer"
yagom.class = "스위프트"
yagom.selfIntroduce()   // 저는 스위프트반 willer입니다

// 인스턴스 생성
let jina: Student = Student()
jina.name = "jina"
jina.selfIntroduce() // 저는 Swift반 jina입니다


//MARK: 구조체와 클래스의 차이

/*
    * 공통점
    - 값을 저장하기 위해 프로퍼티를 정의할 수 있습니다.
    - 기능 실행을 위해 메서드를 정의할 수 있습니다.
    - 서브스크립트 문법을 통해 구조체 또는 클래스가 갖는 값(프로퍼티)에 접근하도록 서브스크립트를 정의할 수 있습니다.
    - 초기화될 때의 상태를 지정하기 위해 이니셜라이저를 정의할 수 있습니다.
    - 초기구현과 더불어 새로운 기능 추가를 위해 익스텐션을 통해 확장할 수 있습니다.
    - 특정 기능을 실행하기 위해 특정 프로토콜을 준수할 수 있습니다
    
    * 차이점
    - 구조체는 상속할 수 없습니다.
    - 타입캐스팅은 클래스의 인스턴스에만 허용됩니다.
    - 디이니셜라이저는 클래스의 인스턴스에만 활용할 수 있습니다.
    - 참조 횟수 계산은 클래스의 인스턴스에만 적용됩니다.
    - ** 구조체는 값 타임이고 클래스는 참조 타입입니다.
*/

//MARK: 값 타입과 참조 타입

/*
    - 구조체는 값 타입이고 클래스는 참조 타입입니다.
    - 값 타입과 참조 타입의 가장 큰 차이는 '무엇이 전달되느냐'입니다.
      예를 들어 어떤 함수의 전달인자로 값 타입의 값을 넘긴다면 전달될 값이복사되어 전달됩니다.
    - 그러나 참조 타입이 전달인자로 전달될 때는 값을 복사하지 않고 참조(주소)가 전달됩니다.
    - 함수의 전달인자로 넘길 때도 참조가 전달되며 다른 변수 또는 상수에 할당될 때도 마찬가지로 참조가 할당됩니다.
*/

struct BasicInformation {
    let name: String
    var age: Int
}

var willerInfo: BasicInformation = BasicInformation(name: "willer", age: 10)
willerInfo.age = 100

// willerInfo의 값을 복사하여 할당합니다!
var friendInfo: BasicInformation = willerInfo

print("willer's age: \(willerInfo.age)")    // 100
print("friend's age: \(friendInfo.age)")    // 100

friendInfo.age = 999


print("willer's age: \(willerInfo.age)")    // 100 - willer의 값은 변동 없습니다.
print("friend's age: \(friendInfo.age)")
// 999 - friendInfo는 willerInfo의 값을 복사해왔기 때문에 별개의 값을 갖습니다.

class Person2 {
    var height: Float = 0.0
    var weight: Float = 0.0
}

var willer: Person2 = Person2()
var friend: Person2 = willer    // willer의 참조를 할당합니다

print("willer's height: \(willer.height)")  // 0.0
print("friend's height: \(friend.height)")  // 0.0

friend.height = 180.0
print("willer's height: \(willer.height)")
// 180.0 - friend는 willer을 참조하기 때문에 값이 변동됩니다.

print("friend's height: \(friend.height)")
// 180.0 - 이를 통해 willer가 참조하는 곳과 friend가 참조하는 곳이 같음을 알 수 있습니다.

func changeBasicInfo(_ info: BasicInformation) {
    var copiedInfo: BasicInformation = info
    copiedInfo.age = 1
}

func changePersonInfo(_ info: Person2) {
    info.height = 150
}

// changeBasicInfo(_:)로 전달되는 전달인자는 값이 복사되어 전달되기 때문에
// willerInfo의 값만 전달되는 것입니다.
changeBasicInfo(willerInfo)
print("willer's age: \(willerInfo.age)") // 100

// changePersonInfo(_:)의 전달인자로 willer의 참조가 전달되었기 때문에
// willer이 참조하는 값들에 변화가 생깁니다.
changePersonInfo(willer)
print("willer's height: \(willer.height)") // 150

/*
    클래스의 인스턴스끼리 참조가 같은지 확인할 때는 식별 연산자를 사용합니다.
*/

var willer2: Person2 = Person2()
let friend2: Person2 = willer2    // willer의 참조를 할당합니다.
let anotherFriend: Person2 = Person2() // 새로운 인스턴스를 생성합니다

print(willer2 === friend2)  // true
print(willer2 === anotherFriend) // false
print(friend !== anotherFriend) // true

//MARK: 스위프트의 기본 데이터 타입은 모두 구조체
/*
    기본 데이터 타입은 모두 값 타입이라는 뜻입니다.
*/


//MARK: 구조체와 클래스 선택해서 사용하기
/*
    ** 애플은 가이드라인에서 다음 조건 중 하나 이상에 해당한다면 구조체를 사용하는 것을 권장합니다.
    - 연관된 간단한 값의 집합을 캡슐화하는 것만이 목적일 때
    - 캡슐화한 값을 참조하는 것보다 복사하는 것이 합당할 때
    - 구조체에 저장된 프로퍼티가 값 타입이며 참조하는 것보다 복사하는 것이 합당할 때
    - 다름 타입으로부터 상속받거나 자신을 상속할 필요가 없을 때
 
    * 구조체의 예
    - 좌표계 (x좌표, y좌표)
    - 물건의 크기 표현
    
    * 이외의 것 대다수 사용자 정의 데이터 타입은 클래스로 구현
*/
