import Foundation
import PlaygroundSupport

// Optionals - similar to nullable
var age: Int? = 28
age = nil

var name: String? = "Bruce Wanye"

var weight: Double? = nil
weight = 198.5

var stringAge = "28"

// parse into string -> converts into Int?
var intAge = Int(stringAge)
print(intAge)

var anotherIntAge = Int("87")
// ! unwraps - turns into whatever optional type it is
// ie. Optional Int -> Int
print(anotherIntAge) // warning: Expression implicitly coerced from 'Int?' to 'Any'
print(anotherIntAge!)

// handling optionals
var favoriteCandy: String? = nil

if favoriteCandy != nil {
    favoriteCandy! // unwrap
}

// if let
if let favoriteCandyUnwrapped = favoriteCandy {
    print(favoriteCandyUnwrapped)
}

// subclasses unwrapping
class Animal {
    var name = ""
    var age = 0
}

class Dog : Animal {
    var furColor = ""
}

var myDog = Dog()

class Monkey : Animal {
    var tail = ""
}

var someAnimal : Animal = Dog()

// as! takes general class and applies specific subclass to the var/constant
let dog = someAnimal as! Dog
dog.furColor

// as? -> check if anotherAnimal is of type Dog
var anotherAnimal : Animal = Monkey()
if let dog = anotherAnimal as? Dog {
    print(dog.furColor)
}

// for loops
for counter in 1...10 {
    print("Hello world! \(counter)")
}

var favCandies = ["100 Grand", "Hershey", "Fun Dip"]

for candy in favCandies {
    print(candy)
}
