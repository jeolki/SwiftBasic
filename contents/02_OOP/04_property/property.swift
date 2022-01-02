/* 프로퍼티 */

//MARK: 프로퍼티의 종류
/*
  저장 프로퍼티
  연산 프로퍼티
  인스턴스 프로퍼티
  타입 프로퍼티
  저장 프로퍼티
*/

import Swift

// MARK: 정의와 사용
/*
    - 프로퍼티는 구조체, 클래스, 열거형 내부에 구현할 수 있습니다.
    - 다만 열거형 내부에는 연산 프로퍼티만 구현할 수 있습니다.
    - 연산프로퍼티는 var로만 선언할 수 있습니다.
    - 연산프로퍼티를 읽기전용으로는 구현할 수 있지만, 쓰기 전용으로는 구현할 수 없습니다.
    - 읽기전용으로 구현하려면 get 블럭만 작성해주면 됩니다. 읽기전용은 get블럭을 생략할 수 있습니다.
    - 읽기, 쓰기 모두 가능하게 하려면 get 블럭과 set블럭을 모두 구현해주면 됩니다.
    - set 블럭에서 암시적 매개변수 newValue를 사용할 수 있습니다.
*/

struct Student {

    // 인슽턴스 저장 프로퍼티
    var name: String = ""
    var `class`: String = "Swift"
    var koreanAge: Int = 0

    // 인스턴스 연산 프로퍼티 // 값들을 연산해서 할당
    var westernAge: Int {
        get {
           return koreanAge - 1
        }

        set(inputValue) {
            koreanAge = inputValue + 1
        }
    }

  // 타입 저장 프로퍼티 : 타입과 연관되어서 저장이 되어야할 프로퍼티
  static var typerDescription: String = "학생"

  /*
  // 인스턴스 메서드
  func selfIntroduce() {
    print("저는 \(self.class)반 \(name)입니다.")
  }
  */

  // 읽기전용 인스턴스 연산 프로퍼티 : 반환값이 없는 함수를 대체가능
  // 간단히 위의 selfIntroduce() 메서드를 대체할 수 있습니다.
  var selfIntroduction: String {
      get {
         return "저는 \(self.class)반 \(name)입니다"
      }
  }

  /*
  // 타입 메서드를
  static func selfIntroduce() {
      print("학생타입입니다.")
  }
  */

  // 읽기전용 타입 연산 프로퍼티
  // 읽기전용에서는 get을 생략할 수 있습니다.
  static var selfIntroduction: String {
      return "학생타입입니다."
  }

}

// 타입 연산 프로퍼티 사용
print(Student.selfIntroduction)
// 학생타입입니다.

// 인스턴스 생성
var willer: Student = Student()
willer.koreanAge = 10

// 인스턴스 저장 프로퍼티 사용
willer.name = "willer"
print(willer.name)
// willer

// 인스턴스 연산 프로퍼티 사용
print(willer.selfIntroduction)
// 저는 Swift반 willer입니다.

print("제 한국나이는 \(willer.koreanAge)살이고, 미국나이는 \(willer.westernAge)살입니다.")
// 제 한국나이는 10살이고, 미국나이는 9살입니다.

//MARK: 응용

// 환률에 따른 돈을 계산하는 예제
struct Money {
    var currencyRate: Double = 1100
    var dollar: Double = 0
    var won: Double {
        get {
            return dollar * currencyRate
        }

        set {
            dollar = newValue / currencyRate
        } // 새로 들어노는 값을 newValue로 표현

    }
}

var moneyInMyPocket = Money()

moneyInMyPocket.won = 11000

print(moneyInMyPocket.won)
// 11000

moneyInMyPocket.dollar = 10

print(moneyInMyPocket.won)
// 110000

//MARK: 지역변수 및 전역변수
/*
    저장 프로퍼티와 연산 프로퍼티의 기능은 함수, 메서드, 클로저, 타입 등의 외부에 위치한 지역/전역 변수에도 모두 사용 가능합니다.
*/

var a: Int = 100
var b: Int = 200
var sum : Int {
   return a + b
}

print(sum)
// 300


//MARK: 프로퍼티 감시자
/*
    - 프로퍼티 감시자를 사용하면 프로퍼티의 값이 변경될 때 원하는 동작을 수행할 수 있습니다.
    - 값이 변경되기 직전에 willSet블럭이, 값이 변경된 직후에 didSet블럭이 호출됩니다.
    - 둘 중 필요한 하나만 구현해 주어도 무관합니다.
    - 변경되려는 값이 기존 값과 똑같더라도 프로퍼티 감시자는 항상 동작합니다.
    - willSet 블럭에서는 암시적 매개변수 newValue를, didSet블럭에서는 oldValue를 사용할 수 있습니다.
    - 프로퍼티 감시자는 연산 프로퍼티에는 사용할 수 없습니다.
    - 프로퍼티 감시자는 함수, 메서드, 클로저, 타입 등의 지역/전역 변수에 모두 사용 가능합니다.
*/

//MARK: 정의 및 사용

struct MoneyAgain {
    // 프로퍼티 감시자 사용
    var currencyRate: Double = 1100 {
        willSet(newRate) {
            print("환율이 \(currencyRate)에서 \(newRate)으로 변경될 예정입니다")
        }
        
        didSet(oldRate) {
            print("환율이 \(oldRate)에서 \(currencyRate)으로 변경되었습니다")
        }
    }
    
    // 프로퍼티 감시자 사용
    var dollar: Double = 0 {
        // willSet의 암시적 매개변수 이름 newValue
        willSet {
            print("\(dollar)달러에서 \(newValue)달러로 변경될 예정입니다")
        }
        
        // didSet의 암시적 매개변수 이름 oldValue
        didSet {
            print("\(oldValue)달러에서 \(dollar)달러로 변경되었습니다")
        }
    }
    
    // 연산 프로퍼티
    var won: Double {
        get {
            return dollar * currencyRate
        }
        set {
            dollar = newValue / currencyRate
        }
        
        /* 프로퍼티 감시자와 연산 프로퍼티 기능을 동시에 사용할 수 없습니다
         willSet {
         
         }
        */
    }
}

var moneyInMyPocketAgain: MoneyAgain = MoneyAgain()

// 환율이 1100.0에서 1150.0으로 변경될 예정입니다
moneyInMyPocketAgain.currencyRate = 1150
// 환율이 1100.0에서 1150.0으로 변경되었습니다
// 0.0달러에서 10.0달러로 변경될 예정입니다
moneyInMyPocketAgain.dollar = 10
// 0.0달러에서 10.0달러로 변경되었습니다
print(moneyInMyPocketAgain.won)
// 11500.0

//프로퍼티 감시자의 기능은
//함수, 메서드, 클로저, 타입 등의 외부에 위치한
//지역/전역 변수에도 모두 사용 가능합니다
var c: Int = 100 {
    willSet {
        print("\(c)에서 \(newValue)로 변경될 예정입니다")
    }
    
    didSet {
        print("\(oldValue)에서 \(c)로 변경되었습니다")
    }
}

// 100에서 200로 변경될 예정입니다
c = 200
// 100에서 200로 변경되었습니다
