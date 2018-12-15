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
