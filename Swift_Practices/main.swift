//
//  main.swift
//  Swift_Practices
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
var students = ["Ben", "Ivy", "Jordell", "Maxime"]
if let i = students.index(of: "Maxime") {
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
// ------------------------ Objects and Classes --------------------------------
// ------------------------ Enumerations and Structures ------------------------
// ------------------------ Protocols and Extensions ---------------------------
// ------------------------ Error Handling -------------------------------------
// ------------------------ Generics -------------------------------------------




