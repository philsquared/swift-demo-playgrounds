// 5 mins

// Unlabeled argument and default labeled argument
// return value
func makeGreeting( _ greeting : String, name : String ) -> String {
    return "\(greeting), \(name)"
}

// explicitly labeled argument
// no return value
func sayHello( to name : String ) {
    print( makeGreeting( "Hello", name: name ) )
}

// No arguments, no return value
func sayHello( ) {
    print( "Hello" )
}

sayHello( to: "world" )
