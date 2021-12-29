/* 옵셔널 */

import Swift

//MARK: 옵셔널(Optional) 사용

/*
    - nil은 옵셔널로 선언된 곳에서만 사용될 수 있습니다.
    - 옵셔널 변수 또는 상수 등은 데이터 타입 뒤에 물음표(?)를 붙여 표현해 줍니다.
    - var myName: Optional<String>처럼 옵셔널을 조금 더 명확하게 써줄 수도 있습니다.
*/

var optionalValue: Int? = 100

switch optionalValue {
case .none:
    print("This Optional variable is nil")
case .some(let value):
    print("Value is \(value)")
}

// nil 할당 가능
optionalValue = nil

// 기존 변수처럼 사용불가 - 옵셔널과 일반 값은 다른 타입이므로 연산불가
//optionalValue = optionalValue + 1


//MARK: 암시적 추출 옵셔널 (Implicitly Unwrapped Optional)

/*
    - 때때로 nil을 할당하고 싶지만, 옵셔널 바인딩으로 매번 값을 추출하기 귀찮거나 로직상 nil 때문에
      런타임 오류가 발생하지 않을 것 같다는 확신이 들 때 nil을 할당해줄 수 있는 옵셔널이 아닌 변수나 상수가
      있으면 좋을 것 같을 때 사용
    - 타입 뒤에 느낌표(!)를 사용
    - 일반 값처럼 사용할 수 있으나, 여전히 옵셔널이기 때문에 nil도 할당해줄 수 있습니다.
    - 그러나, nil이 할당되어 있을 때 접근을 시도하면 런타임 오류가 발생합니다.
*/

var implicitlyUnwrappedOptionalValue: Int! = 100

switch implicitlyUnwrappedOptionalValue {
case .none:
    print("This Optional variable is nil")
case .some(let value):
    print("Value is \(value)")
}

// 기존 변수처럼 사용 가능
implicitlyUnwrappedOptionalValue = implicitlyUnwrappedOptionalValue + 1

// nil 할당 가능
implicitlyUnwrappedOptionalValue = nil

// 잘못된 접근으로 인한 런타임 오류 발생
//implicitlyUnwrappedOptionalValue = implicitlyUnwrappedOptionalValue + 1


/*
    ** 옵셔널을 사용할 때는 강제 추출 또는 암시적 추출 옵셔널을 사용하기보다는 옵셔널 바인딩,
       nil 병합 연산자를 비롯해 뒤에서 배울 옵셔널 체이닝 등의 방법을 사용하는 편이 훨씬 안전합니다.
       또한 이렇게 하는 편이 스위프트의 지향점에 부합합니다.
*/
