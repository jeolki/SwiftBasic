/* 흐름제어 - 반복문 */

import Swift

//MARK: for-in 구문
/*
    - for-in 반복 구문은 반복적인 데이터나 시퀀스를 다룰때 많이 사용합니다.
   
    for <#item#> in <#items#> {
        <#code#>
    }
    
    - for-in 구문은 스위프트의 기본 컬렉션 타입에서도 유용하게 사용할 수 있습니다.
    - 딕셔너리는 넘겨받는 값의 타입이 튜플로 지정되어 넘어옵니다.
*/

var integers = [1, 2, 3]
let people = ["yagom": 10, "eric": 15, "mike": 12]

for integer in integers {
    print(integer)
}

// Dictionary의 item은 key와 value로 구성된 튜플 타입입니다
for (name, age) in people {
    print("\(name): \(age)")
}

// 이후에 map, filter, flatMap 등을 더 알아보자.


//MARK: while 구문

/*
    - 특정 조건(Bool 타입)이 성립하는 한 블록 내부의 코드를 반복해서 실행
    - for-in 구문과 마찬가지로 continue, break 등의 제어 키워드 사용
 
    while <#condition#> {
          <#code#>
    }
*/

while integers.count > 1 {
    integers.removeLast()
}


//MARK: repeat-while 구문

/*
    - repeat 블록의 코드를 최초 1회 실행한 후, while 다음의 조건이 성립하면 블록 내부의 코드를 반복

    repeat {
        <#code#>
    } while <#condition#>

*/

repeat {
    integers.removeLast()
} while integers.count > 0


//MARK: 구문 이름표

/*
    - 반복문을 작성하다 보면 종종 반복문을 중첩으로 작성하게 됩니다.
    - 반복문을 제어하는 키워드(break, continue 등)가 어떤 범위에 적용되어야 하는지 애매하다
    - 큰 범위의 반복문을 종료하고 싶은데 작은 범위의 반복문만 종료되는 등의 실수방지를 위해
    - 반복문 앞에 이름과 함께 클론을 붙여 구문의 이름을 지정해주는 구문 이름표를 사용하면 좋다.
    - 이름이 지정된 구문을 제어하고자 할 때는 제어 키워드와 구문 이름을 함께 써준다.
*/

var numbers: [Int] = [3, 2342, 6, 3252]

numbersLoop: for num in numbers {
    if num > 5 || num < 1 {
        continue numbersLoop
    }
    
    var count: Int = 0
    
    printLoop: while true {
        
        print(num)
        count += 1
        
        if count == num {
            break printLoop
        }
    }
    
    removeLoop: while true {
        
        if numbers.first != num {
            break numbersLoop
        }
        numbers.removeFirst()
    }
    
}

// numbers에는 [2342, 6, 3252]가 남습니다.
