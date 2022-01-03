/* 인스턴스의 생성과 소멸 */

/*
    인스턴스를 생성하는 이니셜라이저와 클래스의 인스턴스가 소멸될 때 호출되는 디이니셜라이저,
    그리고 이와 관련된 것들에 대해 알아봅니다.
    - 프로퍼티 초기값
    - 이니셜라이저 init
    - 디이니셜라이저 deinit
*/

import Swift

//MARK: 프로퍼티 초기값

/*
    - 스위프트의 모든 인스턴스는 초기화와 동시에 모든 프로퍼티에 유효한 값이 할당되어 있어야 합니다.
    - 프로퍼티에 미리 기본값을 할당해두면 인스턴스가 생성됨과 동시에 초기값을 지니게 됩니다.
*/


class PersonA {
    // 모든 저장 프로퍼티에 기본값 할당 : 이유? 클래스가 생성되었을 때 안에 들어있는 프로퍼티는 모두 정상적인 값이 초기화 되어야한다는 규칙이 있다. 없다면 오류가 생기게 된다.
    var name: String = "unknown"
    var age: Int = 0
    var nickName: String = "nick"
}

// 인스턴스 생성
let jason: PersonA = PersonA()

// 기본값이 인스터스가 지녀야 할 값과 맞지 않다면
// 생성된 인스턴스의 프로퍼티에 각각 값 할당
jason.name = "jason"
jason.age = 30
jason.nickName = "j"

// 이것은 우리의 의도와 맞지 않을 수 도 있다. 초기화와 동시에 값을 세팅 하고 싶다.


//MARK: 이니셜라이저(Initializer)

/*
    - 프로퍼티 초기값을 지정하기 어려운 경우에는 이니셜라이저 init을 통해 인스턴스가 가져아 할
      초기값을 전달할 수 있습니다.
*/

class PersonB {
    var name: String
    var age: Int
    var nickName: String

    // 이니셜라이저
    init(name: String, age: Int, nickName: String) {
        self.name = name
        self.age = age
        self.nickName = nickName
    }
}

let jeonggi: PersonB = PersonB(name: "jeonggi", age: 20, nickName: "정기")

/*
    * 프로퍼티의 초기값이 꼭 필요 없을 때
    - 옵셔널을 사용
    - class 내부의 init을 사용할때믄 convenience 키워드 사용
*/

class PersonC {
    var name: String 
    var age: Int
    var nickName: String?

    init(name: String, age: Int, nickName: String) {
        self.name = name
        self.age = age
        self.nickName = nickName
    }

    // 위와 동일한 기능 수행
    /*
    convenience init(name: String, age: Int, nickName: String) {
        self.init(name: name, age: age)
        self.nickName = nickName
    }
    */

    init(name: String, age: Int) {
      self.name = name
      self.age = age
    }
}

let jenny: PersonC = PersonC(name: "jenny", age: 10)
let mike: PersonC = PersonC(name: "mike", age: 15, nickName: "m")

// 암시적 추출 옵셔널은 인스턴스 사용에 꼭 필요하지만 초기값을 할당하지 않고자 할 때 사용

class Puppy {
    var name: String
    var owner: PersonC!

    init(name: String){
        self.name = name
    }

  func goOut() {
    print("\(name)가 주인 \(owner.name)와 산책을 합니다.")
  }
}

let happy: Puppy = Puppy(name: "happy")
// 강아지는 주인없이 산책하면 안돼요!
//happy.goOut() // 주인이 없는 상태라 오류 발생
happy.owner = jenny
happy.goOut()
//happy사 주인 jenny와 산책을 합니다.


//MARK: 실패가능한 이니셜라이저

/*
    - 이니셜라이저 매개변수로 전달되는 초기값이 잘못된 경우 인스턴스 생성에 실패할 수 있습니다.
    - 인스턴스 생성에 실패하면 nil을 반환합니다.
    - 실패가능한 이니셜라이저의 반환타입은 옵셔널 타입입니다.
    - init?을 사용합니다.
*/

class PersonD {
    var name: String
    var age: Int
    var nickName: String?
    
    init?(name: String, age: Int) {
        if (0...120).contains(age) == false {
            return nil
        }
        
        if name.count == 0 {
            return nil
        }
        
        self.name = name
        self.age = age
    }
}

//let john: PersonD = PersonD(name: "john", age: 23)
let john: PersonD? = PersonD(name: "john", age: 23)
let joker: PersonD? = PersonD(name: "joker", age: 123)
let batman: PersonD? = PersonD(name: "", age: 10)


//MARK: 디이니셜라이저(deinitializer)

/*
    클래스의 인스턴스는 참조 타입이므로 더는 참조할 필요가 없을 때 메모리에서 해제됩니다. 이 과정을 소멸이라고 합니다.
    소멸되기 직전에 deinit라는 메서드가 호출됩니다.
 
    - deinit은 클래스의 인스턴스가 메모리에서 해제되는 시점에 호출됩니다.
    - 인스턴스가 해제되는 시점에 해야할 일을 구현할 수 있습니다.
    - deinit은 매개변수를 지닐 수 없습니다.
    - 디이니셜라이저는 클래스 타입에만 구현할 수 있습니다.
    - 인스턴스가 메모리에서 해제되는 시점은 ARC(Automatic Reference Counting) 의 규칙에 따라 결정됩니다.
    - ARC에 대해 더 자세한 사항은 ARC문서를 참고해주세요
*/

class PersonE {
    var name: String
    var pet: Puppy?
    var child: PersonC

    init(name: String, child: PersonC) {
        self.name = name
        self.child = child
    }

    // 인스터스가 메모리에서 해제되는 시점에 자동 호출
    deinit {
        if let petName = pet?.name {
            print("\(name)가 \(child.name)에게 \(petName)를 인도합니다.")
            self.pet?.owner = child
        }
    }
}

var donald: PersonE? = PersonE(name: "donald", child: jenny)
donald?.pet = happy
donald = nil // donald 인스턴스가 더이상 필요없으므로 메모리에서 해제됩니다.
// donald가 jenny에게 happy를 인도합니다.
