//
//  main.swift
//  Swift_3_Practices
//
//  Created by ye charles on 10/31/16.
//  Copyright (c) 2016 ye charles. All rights reserved.
//

import Foundation

print("HELLO, HERE IS A SWIFT TOUR!")

// ------------------------ SIMPLE VALUES DEFINATION ---------------------------------------

// define a const
let nameConst = "charles"                 // string must be double-quoted

// define int const
let intConst = 1024

let IntConst = Int()
assert(IntConst == 0)                     // true
//  IntConst = 12                         // cannot reassign to 'let' constant

// define double const
let implicitDouble = 70.0

// define float const
let floatConst: Float = 1024.0

// define a var
var nameVar = "charles"

//----- type conversion

let appName = "AwesomeApp"

let appVersion = 1.2

// print(appName + appVersion) error

print(appName + String(appVersion))

// case string by '\()'
print("AwesomeApp \(appVersion)")

//----- array, list, dictionary defination

var todoList = ["todo 1", "todo 2", "todo 3"]
todoList.append("todo 4")
print(todoList)

var IntIndexDict = [1: "one", 2: "two"]
print(IntIndexDict)

var StringIndexDict = ["a": "Apple", "b": "Bar", "c": "Cat"]
print(StringIndexDict)

// var dict = ["a": "Apple", "b": "Bar", "c": "Cat", 1: "one", 2: "two"]
// Error: heterogenous collection literal could only be inferred to '[AnyHashable : String]'; add explicit type annotation if this is intentional

let emptyArr = [String]()
let emptyDictionary = [String: String]()
print(emptyArr, emptyDictionary)

print(" ----- array index")
var students = ["Ben", "Ivy", "Josh", "Maxi"]
if let i = students.index(of: "Maxi") {
    students[i] = "Max"
}
print(students)

// ------------------------ CONTROL FLOW ---------------------------------------

print(" ----- for")
var fellows = ["jim", "tom", "jack"]
for item in fellows {
   print("hi, \(item)!")
}
for item in 0 ..< 2 {                        // jack would't say hello
   print("Hello, I am \(fellows[item]).")
}
var treasure = [
        "A" : ["Be careful!  Is it classified?", "Good news.  Ten weeks from Friday will be a pretty good day."],
        "B" : ["Be careful!  Is it classified?", "Chess tonight.", "If you stand on your head, you will get footprints in your hair."],
        "C" : ["Don't look now, but the man in the moon is laughing at you.", "Chess tonight."],
]
for (catalog, quotes) in treasure {          // (index, item) must be quoted
    for quote in quotes {
        print("For looping treasure(\(catalog)) \(quotes.index(of: quote)): \(quote)!")  // index(of: ..) weird syntax
    }
}

print(" ----- while")
var cnt = fellows.count - 1
while cnt >= 0 {
   print("Awesome while statement is looping now... \(cnt) : \(fellows[cnt])")
   cnt -= 1                                  // operator -- had been removed from swift 3
}

var m = 2
repeat {                                     // I won't tell u repeat equals do
    m = m * 2
} while m < 100
print(m)

print(" ----- switch")
let guyInChina = "Golden Jim"
switch (guyInChina) {
case "Tom", "Jim":
    print("Victory loves preparation.")                        // break is redundant
case "Jack", "Luce":
    print("Victory loves talent.")
case let x where x.uppercased().hasPrefix("GOLDEN"):           // x represent matched stuff
    print("Victory loves rich daddy.  ---- \(x)")
default:
    print("Victory loves nobody.")
}

print(" ----- optional and default")
let life: String? = "shit"
if let life = life {   // Q: redeclaration is allowed here? A: initializer for conditional binding must have Optional type, not 'String'
    print("Life is \(life).")
} else {
    print("Life is empty.")
}

print("If nil, default is \(nil ?? "null").")


// ------------------------ Functions and Closures -----------------------------

print(" ----- function")
func eat(animal: String, food: String) -> String {   // symbol -> specify the return type
    return "\(animal.capitalized) eat \(food)."
}
print(eat(animal: "monkey", food: "banana"))         // argument labels can't be omitted looks fool

func greet(_ name: String, time age: Int, _ addr: String) -> String { // allow label omit by _, specify time as age's label(which default is age if omitted)
    return "My name is \(name), i am \(age), live in \(addr)."
    // return "My name is \($0), i am \($1), live in \($2)."          // Error refer anonymous closure argument by numbers only works in a closure
}
print(greet("Charles", time: 16, "hell"))
//print(greet("Charles", time: 16, addr: "heaven"))  // Error extraneous argument label 'addr:'

func calculate(numbers: Int..., method: ([Int]) -> Int) {
    print("calculating...")
    print(method(numbers))
}

func getCalculateMethod(_ name: String) -> ([Int]) -> Int {  // return function prototype declaration, args must be quoted
                                                             // Can it be auto generated by editor?

    func add(numbers: [Int]) -> Int {  // sick, can't return func directly from here, only return func name available
        var sum = 0
        for item in numbers {
            sum += item
        }
        return sum
    }

    switch (name) {
    case "add":
        return add
    default:
        return add
    }
}
calculate(numbers: 22, 78, 10, method: getCalculateMethod("add"))


print(" ----- array map and closure")
var numbers = [20, 19, 7, 12]
var rt = numbers.map({        // use map with tuple
    (number: Int) -> Int in   // use `in` to separate prototype and function body in closure created with `{}`
    let result = 3 * number
    return result
})
print(rt)

func lessThanTen(number: Int) -> Bool {
    return number < 10
}
print(numbers.map(lessThanTen))
print(numbers.map({ number in number * 10 })) // simple closure, omit arg type ant return type

numbers.sort()                  // sort asc
print(numbers)
numbers.sort(by: { $0 > $1 })   // sort desc
print(numbers)

// NOTE: A closure passed as the last argument to a function can appear immediately after the parentheses.
// When a closure is the only argument to a function, you can omit the parentheses entirely. So:
// numbers.sort(){ $0 > $1 }   it works
// numbers.sort { $0 > $1 }    it works too


// ------------------------ Objects and Classes --------------------------------

public class Actor {

    let version: Float = 1.1
    var blood: Int = 0
    var magic: Int = 0
    var name: String?
    var fullName: String {
        get {
            return "\(self.name ?? "") \(version)"
        }
        set {
            self.name = newValue
        }
    }

    init(blood: Int, magic: Int) {
        defer {
            self.blood = 50
            self.magic = 50
        }
        self.blood = blood
        self.magic = magic
    }

    private func getBlood() -> Int {
       return self.blood
    }

    private func getMagic() -> Int {
        return self.magic
    }

    public func fight() -> Actor {
        self.magic -= 10
        return self
    }


    public func hurt(_ num: Int? = 5) -> Actor {
        self.blood -= (num ?? 10)
        // self.blood -= num // Error:value of optional type 'Int?' not unwrapped; did you mean to use '!' or '?'?
        return self
    }

    func status() {
        print(getBlood())
        print(getMagic())
    }

}

var actor = Actor(blood: 100, magic: 100)
actor.status()                                  // output 50 50 cuz change happened in defer
actor.hurt().hurt(20).fight().fight().status()  // blood cut 25
actor.hurt(nil).status()                        // blood cut 10 this time, wtf
actor.name = "Charles"
print(actor.fullName)



// ------------------------ Enumerations and Structures ------------------------
// ------------------------ Protocols and Extensions ---------------------------
// ------------------------ Error Handling -------------------------------------
// ------------------------ Generics -------------------------------------------
