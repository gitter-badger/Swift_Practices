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
let nameConst = "charles" // string must be double-quoted

// define int const
let intConst = 1024

let IntConst = Int()
assert(IntConst == 0)     // true
//  IntConst = 12         // cannot reassign to 'let' constant

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

// ------------------------ CONTROL FLOW ---------------------------------------
// ------------------------ Functions and Closures -----------------------------
// ------------------------ Objects and Classes --------------------------------
// ------------------------ Enumerations and Structures ------------------------
// ------------------------ Protocols and Extensions ---------------------------
// ------------------------ Error Handling -------------------------------------
// ------------------------ Generics -------------------------------------------
