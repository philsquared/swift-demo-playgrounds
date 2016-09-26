// 5 mins

var maybe : String?

maybe = "Now I'm a string"

// Can use map to deal with optionals
maybe.map { m in print( m ) }

// use it "functionally"
let lcase = maybe.map { m in m.lowercased }
lcase

// converting strings to ints - yields an optional
let i7 = Int("Blakes7")
i7 ?? -1 // nil coalescing

// Map an array of strings to (optional) ints
let fib = ["1", "1", "2", "spanner", "3", "5"]
fib
    .map { Int($0) }
    // filter out the nils and map out the optionals
    .filter { $0 != nil }
    .map{ $0! }

// flatMap does it all in one step
fib.flatMap
    { Int($0) }
