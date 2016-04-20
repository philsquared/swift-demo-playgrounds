// 15 mins

let languages = ["Java", "C++", "Swift", "Python", "Haskell", "F#"]

languages.sort()

// Full function
func backwards( s1 : String, s2: String ) -> Bool {
    return s1 > s2
}

languages.sort( backwards )


// closure
languages.sort(
    { ( s1 : String, s2: String ) -> Bool in
        return s1 > s2
    } )

// type inference
languages.sort(
    { ( s1, s2 ) in return s1 > s2 } )

// Omit needless words
languages.sort
    { s1, s2 in s1 > s2 }

// unnamed args
languages.sort
    { $0 > $1 }

// use operator as func
languages.sort(>)
