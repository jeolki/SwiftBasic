/* 데이터 타입 고급 */

import UIKit

//MARK: 컬렉션형 : 배열(Array), 딕셔너리(Dictionary), 세트(Set)
/*
    Array - 순서가 있는 리스트 컬렉션
    Dictionary - 키와 값의 쌍으로 이루어진 컬렉션
    Set - 순서가 없고, 멤버가 유일한 컬렉션
*/

/*
    * 배열(Array)
    - 같은 타입의 데이터를 일렬로 나열한 후 순서대로 저장하는 형태의 컬렉션 타입
    - 사용시 Array라는 키워드와 타입 이름의 조합으로 사용
    - 대괄호로 값을 묶어 Array 타입임을 표현할 수도 있다.
    - isEmpty 프로퍼티로 비어있는 배열인지 확인 가능하다.
    - 배열에 몇 개의 요소가 존재하는지 알고 싶으면 count 프로퍼티를 확인
    
    ** 스위프트의 Array는 C언어의 배열처럼 버퍼(Buffer)입니다. 단 C언어 처럼 한 번 선언하면 크기가
       고정되던 버퍼가 아니라, 필요에 따라 자동으로 버퍼의 크기를 조절해주므로 요소의 삽입 및 삭제가 자유롭다.
 
    - 맨 처음과 맨 마지막 요소는 first와 last 프로퍼티를 통해 가져올 수 있습니다.
    - index(of:) 메서드를 사용하면 해당 요소의 인덱스를 알아낼 수도 있습니다.
        * 만약 중복된 요소가 있다면 제일 먼저 발견된 요소의 인덱스를 반환합니다.
    - append(_:) : 맨 뒤에 요소를 추가
    - insert(_:at:) : 중간에 요소 삽입
    - remove(_:) : 요소를 삭제, 요소가 삭제된 후 반환
*/

// 빈 Int Array 생성
var integers: Array<Int> = Array<Int>()
integers.append(1)
integers.append(100)
//integers.append(101.1)

print(integers) // [1, 100]
print(integers.contains(100)) // true
print(integers.contains(99)) // false

integers.remove(at: 0)
integers.removeLast()
integers.removeAll()

print(integers.count)   // 0

//integers[0] // 범위 초과 - 런타임 오류 발생

// Array<Double>와 [Double]는 동일한 표현
// 빈 Double Array 생성
var doubles: Array<Double> = [Double]()

// 빈 String Array 생성
var strings: [String] = [String]()

// 빈 Character Array 생성
// []는 새로운 빈 Array
var characters: [Character] = []

// let을 사용하여 Array를 선언하면 불변 Array
let immutableArray = [1, 2, 3]

// 불면 Array의 요소는 추가/삭제 불가 - 컴파일 오류 발생
//immutableArray.append(4)
//immutableArray.removeAll()

var numbers: Array<Int> = Array<Int>()
numbers.append(1)
numbers.append(2)
numbers.append(3)

numbers[0] // 1
numbers[1] // 2
 
numbers.insert(4, at:2) // [1,2,4,3]
numbers // [1,2,4,3]

// 배열의 일부만 가져오기
numbers[1...2]


/*
    * 딕셔너리(Dictionary)
    - 딕셔너리는 요소들이 순서 없이 키와 값의 쌍으로 구성되는 컬렉션 타입
    - 딕셔너리 안에는 키가 하나이거나 여러 개일 수 있습니다.
    - 하나의 딕셔너리 안의 키는 같은 이름을 중복해서 사용할 수 없습니다.
    - Dictionary라는 키워드와 타입과 값의 타입 이름의 조합으로 선언한다.
    - isEmpty 프로퍼티를 통해 비어있는 딕셔너리 인지 확인
    - count 프로퍼티로 딕셔너리의 요소 개수를 확인
    - 딕셔너리는 각 값에 키로 접근할 수 있습니다.
    - 딕셔너리 내부에서 키는 유일해야 합니다. 값은 유일하지 않아도 됩니다.
    - 딕셔너리는 내부에 없는 키로 접근해도 오류가 발생하지 않습니다. nil을 반환합니다.
    - 특정 키에 해당하는 값을 제거하려먼 removeValue(forKey:) 메서드 사용. 키에 해당 값 제거 후 반환
*/

// Key가 String 타입이고 Value가 Any인 빈 Dictionary 생성
var anyDictionary: Dictionary<String, Any> = [String: Any]()
anyDictionary["someKey"] = "value"
anyDictionary["anotherKey"] = 100
print(anyDictionary) // ["someKey": "value", "anotherKey": 100]

// Key에 해당하는 값 변경
anyDictionary["someKey"] = "dictionary"
print(anyDictionary) // ["someKey": "dictionary", "anotherKey": 100]

// Key에 해당하는 값 제거
anyDictionary.removeValue(forKey: "anotherKey")
anyDictionary["someKey"] = nil
print(anyDictionary) // [:]

// 빈 Dictionary 생성
let emptyDictionary: [String: String] = [:]

// 초기 값을 가지는 Dictionary 생성
let initalizedDictionary: [String: String] = ["name": "yagom", "gender": "male"]

// let으로 선언한 불변 Dictionary는 수정 불가 - 컴파일 오류 발생
//emptyDictionary["key"] = "value"

// name 키에 해당하는 값이 Dictionary에 존재하지 않을 수 있으므로
// 컴파일 오류 발생 - 옵셔널 파트에서 상세히 다룹니다
//let someValue: String = initalizedDictionary["name"]

var dic: [String: Int] = ["willer": 1]
dic["윌러"] = 3
dic["정기"] = 5
dic

// 삭제
dic.removeValue(forKey: "윌러")

/*
    * 세트(Set)
    - 세트는 같은 타입의 데이터를 순서 없이 하나의 묶음으로 저장하는 형태의 컬렉션 타입
    - 세트 내의 값은 모두 유일한 값, 즉 중복된 값이 존재하지 않는다.
    - 세트는 보통 순서가 중요하지 않거나 각 요소가 유일한 값이어야 하는 경우에 사용합니다
    - 세트의 요소로는 해시 가능한 값이 들어와야 값이 들어와야 합니다.
    - Set 키워드와 타입 이름의 조합으로 써줍니다.
    - 대괄호로 값들을 묶어 세타 타입임을 표현합니다.
    - isEmpty 프로퍼티를 통해 비어있는 세트인지 확인해볼 수 있습니다.
    - count 프로퍼티를 통해 몇 개의 요소가 존재하는지 알 수 있습니다.
    - insert(_:) : 세트에 요소를 추가합니다
    - remove(_:) : 요소를 삭제합니다.
*/

// 빈 Int Set 생성
var integerSet: Set<Int> = Set<Int>()
integerSet.insert(1)
integerSet.insert(100)
integerSet.insert(99)
integerSet.insert(99)
integerSet.insert(99)

print(integerSet) // [100, 99, 1]
print(integerSet.contains(1)) // true
print(integerSet.contains(2)) // false
integerSet.remove(100)
integerSet.removeFirst()

print(integerSet.count) // 1
// Set는 집합 연산에 꽤 유용합니다
let setA: Set<Int> = [1, 2, 3, 4, 5]
let setB: Set<Int> = [3, 4, 5, 6, 7]

// 합집합
let union: Set<Int> = setA.union(setB)
print(union) // [2, 4, 5, 6, 7, 3, 1]

// 합집합 오름차순 정렬
let sortedUnion: [Int] = union.sorted()
print(sortedUnion) // [1, 2, 3, 4, 5, 6, 7]

// 교집합
let intersection: Set<Int> = setA.intersection(setB)
print(intersection) // [5, 3, 4]

// 차집합
let subtracting: Set<Int> = setA.subtracting(setB)
print(subtracting) // [2, 1]

/*
    * 컬렉션에서 임의의 요소 추출과 뒤섞기
    - 스위프트 4.2버전에서 컬렉션에서 임의의 요소를 추출하는 randomElement() 메서드와 컬렉션의
      요소를 임의로 뒤섞는 shuffle() 메서드가 추가되었습니다.
*/

var arrayShuffle: [Int] = [1,2,3,4,5]
arrayShuffle.shuffle()
arrayShuffle.randomElement()
