/* 타입 캐스팅 */

/*
  1. 스위프트 타입 캐스팅
  - 인스턴스의 타입을 확인 하는 용도
  - 클래스의 인스턴스를 부모 혹은 자식 클래스의 타입으로 사용할 수 있는지 확인 하는 용도
  - is, as를 사용합니다.
  * 형변환은 타입 캐스팅이 아니라 새로운 값을 생성하는 것입니다.
  ex) let someDouble = Double(2)
*/

import Swift

/*
  2. 예제 클래스
*/

class Person {
    var name: String = ""
    func breath() {
        print("숨을 쉽니다.")
    }
}

class Student: Person {
    var school: String = ""
    func goToSchool() {
        print("등교를 합니다.")
    }
}

class UniversityStudent: Student {
    var major: String = ""
    func goToMT() {
        print("멤버쉽 트레이닝을 갑니다 신남!")
    }
}

// 인스턴스 생성
var willer: Person = Person()
var jeonggi: Student = Student()
var jason: UniversityStudent = UniversityStudent()

/*
  2. 타입확인
  - is를 사용하여 타입을 확인합니다.
*/

var result: Bool

result = willer is Person // true
result = willer is Student // false
result = willer is UniversityStudent // false

result = jeonggi is Person // true
result = jeonggi is Student // true
result = jeonggi is UniversityStudent // false

result = jason is Person // true
result = jason is Student // true
result = jason is UniversityStudent // true

if willer is UniversityStudent {
    print("willer는 대학생입니다.")
} else if willer is Student {
    print("willer는 학생입니다.")
} else if willer is Person {
    print("willer는 사람입니다.")
} // willer는 사람입니다.

switch jason {
case is Person:
    print("jason은 사람입니다.")
case is Student:
    print("jason은 학생입니다.")
case is UniversityStudent:
    print("jason은 대학생입니다.")
default:
    print("jason은 사람도, 학생도, 대학생도 아닙니다.")
} // jason은 사람입니다.

switch jason {
case is UniversityStudent:
    print("jason은 대학생입니다.")
case is Student:
    print("jason은 학생입니다.")
case is Person:
    print("jason은 사람입니다.")
default:
    print("jason은 사람도, 학생도, 대학생도 아닙니다.")
} // jason은 대학생입니다.

/*
  3. 업 캐스팅(Up Casting)
  - as를 사용하여 부모클래스의 인스턴스로 사용할 수 있도록 컴파일러에게 타입정보를 전환해줍니다.
  - Any 혹은 AnyObject로도 타입정보를 변환할 수 있습니다.
  - 암시적으로 처리되므로 꼭 필요한 경우가 아니라면 생략해도 무방합니다.
*/

// UniversityStudent 인스턴스를 생성하여 Person 행세를 할 수 있도록 업 캐스팅
var mike: Person = UniversityStudent() as Person

var jenny: Student = Student()
// var jina: UniversityStudent = Person() as UniversityStudent // 컴파일 오류

// UniversityStudent 인스턴스를 새성하여 Any 행세를 할 수 있도록 업캐스팅
var jina Any = Person() // as Any 생략가능

/*
  4. 다운 캐스팅(Down Casting)
  - as? 또는 as!를 사용하여 자식 클래스의 인스턴스로 사용할 수 있도록 컴파일러에게 인스턴스의 타입정보를 전환해줍니다.
*/

/*
  A. 조건부 다운 캐스팅
  - as?를 사용합니다.
  - 캐스팅에 실패하면, 즉 캐스팅하려는 타입에 부합하지 않는 인스턴스라면 nil을 반환하기 때문에 결과의 타입은 옵셔널 타입입니다.
*/

var optionalCasted: Student?

optionalCasted = mike as? UniversityStudent
optionalCasted = jenny as? UniversityStudent // nil
optionalCasted = jina as? UniversityStudent // nil
optionalCasted = jina as? Student // nil

/*
  B. 강제 다운 캐스팅
  - as!를 사용합니다.
  - 캐스팅에 실패하면, 즉 캐스팅하려는 타입에 부합하지 않는 인스턴스라면 런타임 오류가 발생합니다.
  - 캐스팅에 성공하면 옵셔널이 아닌 일반 타입을 반환합니다.
*/

var forcedCasted: Student

forcedCasted = mike as! UniversityStudent
//forcedCasted = jenny as! UniversityStudent // 런타임 오류
//forcedCasted = jina as! UniversityStudent // 런타임 오류
//forcedCasted = jina as! Student // 런타임 오류

/*
  5. 활용
*/

func doSomethingWithSwitch(someone: Person) {
    switch someone {
    case is UniversityStudent:
        (someone as! UniversityStudent).goToMT()
    case is Student:
        (someone as! Student).goToSchool()
    case is Person:
        (someone as! Person).breath()
    }
}

doSomethingWithSwitch(someone: mike as Person) // 멤버쉽 트레이닝을 갑니다 신남!
doSomethingWithSwitch(someone: mike as Person) // 멤버쉽 트레이닝을 갑니다 신남!
doSomethingWithSwitch(someone: jenny) // 등교를 합니다
doSomethingWithSwitch(someone: willer) // 숨을 쉽니다.

func doSomething(someone: Person) {
    if let universityStudent = someone as? UniversityStudent {
        universityStudent.goToMT()
    } else if let student = someone as? Student {
        student.goToSchool()
    } else if let person = someone as? Person {
        person.breath()
    }
}

doSomething(someone: mike as Person) // 멤버쉽 트레이닝을 갑니다 신남!
doSomething(someone: mike) // 멤버쉽 트레이닝을 갑니다 신남!
doSomething(someone: jenny) // 등교를 합니다
doSomething(someone: willer) // 숨을 쉽니다.