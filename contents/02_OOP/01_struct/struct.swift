/* 구조체와 클래스 */

import Swift

//MARK: 구조체

/*
    * 구조체 정의
    - 구조체는 struct 키워드로 정의합니다.
 
    struct <#이름#> {
        /* <#구현부#> */
    }
 
    ** 구조체 명명법
    - 구조체를 정의한다는 것은 새로운 타입을 생성해주는 것과 마찬가지이므로 기본 타입 이름(Int, String)처럼
      대문자 카멜케이스를 사용하여 이름을 지어줍니다. 프로퍼티와 메서드는 소문자 카멜케이스를 사용하여 이름을
      지어줍니다.
*/

struct BasicInformation {
    var name: String
    var age: Int
}


//MARK: 프로퍼티 및 메서드
/*
    * 구조체 인스턴스의 생성 및 초기화
    - 구조체 정의를 마친 후, 인스턴스를 생성하고 초기화 하고자 할 때는 기본적으로 생성되는
      멤버와이즈 이니셜라이저를 사용합니다.
    - 구조체에 기본 생성된 이니셜라이저의 매개변수는 구조체의 프로퍼티 이름으로 자동 지정됩니다.
    - 인스턴스가 생성되고 초기화된 후 프로퍼티 값에 접근하고 싶다면 마침표(.)를 사용하면 됩니다.
    - let으로 선언하면 인스턴스 내부의 프로퍼티 값을 변경할 수 없고, var르 선언하면 변경할 수 있다.
*/

struct Sample {
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
    static func typeMethod() {
        print("type method")
    }
}


//MARK: 구조체 사용

// 가변 인스턴스
var mutable: Sample = Sample()

// 불변 프로퍼티는 인스턴스 생성 후 수정할 수 없습니다
// 컴파일 오류 발생
//mutable.immutableProperty = 200

// 불변 인스턴스
let immutable: Sample = Sample()

// 불변 인스턴스는 아무리 가변 프로퍼티라도
// 인스턴스 생성 후에 수정할 수 없습니다
// 컴파일 오류 발생
//immutable.immutableProperty = 200


// 타입 프로퍼티 및 메서드
Sample.typeProperty = 300
Sample.typeMethod() // type method

// 인스턴스에서는 타입 프로퍼티나 타입 메서드를
// 사용할 수 없습니다
// 컴파일 오류 발생
//mutable.typeProperty = 400
//mutable.typeMethod()


//MARK: 학생 구조체

struct Student {
    // 가변 프로퍼티
    var name: String = "unknown"
    
    // 키워드도 `로 묶어주면 이름으로 사용할 수 있습니다
    var `class`: String = "Swift"
    
    // 타입 메서드
    static func selfIntroduce() {
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

// 가변 인스턴스 생성
var yagom: Student = Student()
yagom.name = "willer"
yagom.class = "스위프트"
yagom.selfIntroduce()   // 저는 스위프트반 willer입니다

// 불변 인스턴스 생성
let jina: Student = Student()

// 불변 인스턴스이므로 프로퍼티 값 변경 불가
// 컴파일 오류 발생
//jina.name = "jina"
jina.selfIntroduce() // 저는 Swift반 unknown입니다
