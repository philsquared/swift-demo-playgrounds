// 15 mins

// let & var
let i = 1
let str = "hello"
//let str : String = "hello" // show type annotation

// str += ", accu" // doesn't compile

var str2 = "hello" // change to var
str2 += ", NorDev"

// can print (directly)
print( str2 )

// string interpolation
print( "Message: \(str2)")

// not a print thing - works for any string
let msg = "Message: \(str2)"

// array literals
let a = [1, 2, 3]
a[2]

// Set
//let set : Set = [1, 1, 2, 3, 5]

// dictionaries
//let d = [1: "one", 2: "two", 3: "three"]
//let two = d[2]

// now we get to the interesting stuff

// Optionals
var maybe : String?
//var maybe : Optional<String> // can spell Optional out fully

maybe == nil

// How to get value from an optional?
// 1. brute force
maybe = "now I'm a string"
if maybe != nil
{
    print( maybe! )
}
// 2. if let
if let m = maybe
{
    print( m )
}

// Optional chaining

// maybe = nil // Do this second
let size = maybe?.characters.count


// **** 3. switch - will look at this later
switch( maybe )
{
case .some(let m): print( m )
case nil: break
}
// ****

