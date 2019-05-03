import Foundation

// implementation of Haskellish type classes as in https://en.m.wikipedia.org/wiki/Type_class
protocol Eq {
    func eq(a: Self) -> Bool
    func neq(a: Self) -> Bool
}

func elem<A: Eq>(a: A, ass: [A]) -> Bool {
    guard let y = ass.first else { return false }
    return y.eq(a: a) || elem(a: a, ass: Array(ass.dropFirst()))
}

struct A: Equatable, Eq {
    let id = UUID().uuidString
    
    func eq(a: A) -> Bool {
        return self == a
    }
    
    func neq(a: A) -> Bool {
        return self != a
    }
}

let a1 = A()
let a2 = A()
let a3 = A()
let a4 = A()
let ass = [a1, a2, a3]

elem(a: a1, ass: ass)
elem(a: a4, ass: ass)


