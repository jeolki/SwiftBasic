/* 데이터 타입 기본 */

import UIKit

/*
    스위프트의 모든 데이터 타입 이름은 첫 글자가 대문자로 시작하는 대문자 카멜케이스를 사용합니다.

    ** Swift의 기본 데이터 타입
    Bool, Int, UInt, Float, Double, Character, String
*/


//MARK: Int와 UInt
/*
    - 정수타입
    - Int : +, - 부호를 포함한 정수
    - UInt : - 부호를 포함하지 않는 0을 포함한 양의 정수
    - 최댓값과 최솟값은 각각 max와 min 프로퍼티로 알아볼 수 있습니다.
    - Int.max와 UInt.max의 사이값만 UInt를 사용하는 것이 좋습니다.
*/

// Int
var someInt: Int = -100
someInt = 100
// someInt = 100.1 // 컴파일 오류발생

// UInt
var someUInt: UInt = 100
// someUInt = -100 // 컴파일 오류발생
// someUInt = someInt // 컴파일 오류발생

/*
    - 10진수 : 우리가 평소에 쓰던 숫자와 동일하게 작성
    - 2진수 : 접두어 0b를 사용하여 표현
    - 8진수 : 접두어 0o를 사용하여 표현
    - 16진수 : 접두어 0x를 사용하여 표현
*/

let decimalInteger: Int = 28
let binartInteger: Int = 0b11100    //  2진수로 10진수 28을 표현합니다.
let octalInteger: Int = 0o34        //  8진수로 10진수 28을 표현합니다.
let hexadecimalIntege: Int = 0x1C   //  16진수로 10진수 28을 표현합니다.


//MARK: Bool
/*
    불리언 타입은 참(true) 또는 거짓(false)만 값으로 가집니다.
*/

// Bool
var someBool: Bool = true
someBool = false
// someBool = 0 // 컴파일 오류발생
// someBool = 1 // 컴파일 오류발생


//MARK: Float과 Double
/*
    Float과 Double은 부동소수점을 사용하는 실수며 부동소수 타입이라고 합니다.
    흔히 우리가 말하는 소수점 자리가 있는 수입니다.
    부동소수 타입은 정수 타입보다 훨씬 넓은 범위의 수를 표현할 수 있습니다.
*/

// Float
var someFloat: Float = 3.14
someFloat = 3
print(someFloat)

// Double
var someDouble: Double = 3.14
someDouble = 3
// someDouble = someFloat // 컴파일 오류발생

/*
    임의의 수 만들기
    스위프트 4.2 버전부터 임의의 수를 만드는 random(in:) 메서드가 추가되었습니다.
    정수, 실수 모두 임의의 수를 만들 수 있습니다.
*/
Int.random(in: -100...100)
UInt.random(in: 1...30)
Double.random(in: 1.5...4.3)
Float.random(in: -0.5...1.5)


//MARK: Character
/*
    단어, 문장처럼 문자의 집합이 아닌 단 하나의 문자를 의미합니다.
*/

// Character
var someCharacter: Character = "🇰🇷"
someCharacter = "😄"
someCharacter = "가"
someCharacter = "A"
// someCharacter = "하하하" // 컴파일 오류발생
print(someCharacter)


//MARK: String
/*
    String은 문자의 나열, 즉 문자열입니다.
*/

// String
var someString: String = "하하하 😄 "
someString = someString + "웃으면 복이와요"
print(someString)

// someString = someCharacter // 컴파일 오류발생
someString = """
여러줄 문자열을
사용할 수 있습니다.
첫 줄에 겹따옴표 세 개,
마지막 줄에 겹따옴표 세 개를
사용하면 됩니다.
"""

someString = """
겹따옴표 세 개인 줄(첫줄, 끝줄)에서
줄 바꿈을 하지 않으면 오류가 발생합니다.
"""

/*
someString = """오류발생
오류발생"""
*/

/*
    *특수문자
    스위프트에는 문자열 내에서 일정 기능을 하는 특수문자(제어문자)가 있습니다.
    특수문자는 모두 백슬래시에 특정한 문자를 조합하여 사용합니다.
 
    \n : 줄바꿈 문자
    \\ : 문자열 내에서 백슬래시를 표현하고자 할 때 사용
    \* : 문자열 내에서 ㄱ큰따옴표를 표현하고자 할 때 사용
    \t : 탭 문자, 키보드의 탭키를 눌렀을 때와 같은 효과
    \O : 문자열이 끝났음을 알리는 null 문자
*/


//MARK: Any, AnyObject와 nil
/*
    Any - Swift의 모든 타입을 지칭하는 키워드
    AnyObject -  모든 클래스 타입을 지칭하는 프로토콜
    nil - 없음을 의미하는 키워드
*/

// Any
var someAny: Any = 100
someAny = "어떤 타입도 수용 가능합니다"
someAny = 123.12

// Any 타입에 Double 자료를 넣어두었더라도
// Any는 Double 타입이 아니기 때문에 할당할 수 없습니다
// 명시적으로 타입을 변환해 주어야 합니다.
// 타입 변환은 차후에 다룹니다
//let someDouble: Double = someAny  // 컴파일 오류발생

// AnyObject
class SomeClass {}

var someAnyObject: AnyObject = SomeClass()

// AnyObject는 클래스의 인스턴스만 수용 가능하기 때문에
// 클래스의 인스턴스가 아니면 할당할 수 없습니다
//someAnyObject = 123.12    // 컴파일 오류발생

// nil은 없음을 의미하는 키워드입니다
// 다른 언어의 NULL, Null, null 등과 유사한 표현입니다.
// someAny는 Any 타입이고,
// someAnyObject는 AnyObject 타입이기 때문에
// nil을 할당할 수 없습니다
// nil을 다루는 방법은 옵셔널에서 다룹니다.

// nil
//someAny = nil         // 컴파일 오류발생
//someAnyObject = nil   // 컴파일 오류발생

