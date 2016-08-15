// 15 mins

let languages = ["Java", "C++", "Swift", "Python", "Haskell", "F#"]

languages.sorted()

// Full function
func backwards( s1 : String, s2: String ) -> Bool {
    return s1 > s2
}

languages.sorted( by: backwards )


// closure
languages.sorted( by:
    { ( s1 : String, s2: String ) -> Bool in
        return s1 > s2
    } )

// type inference
languages.sorted( by:
    { ( s1, s2 ) in return s1 > s2 } )

// Omit needless words
languages.sorted
    { s1, s2 in s1 > s2 }

// unnamed args
languages.sorted
    { $0 > $1 }

// use operator as func
languages.sorted( by: >)
