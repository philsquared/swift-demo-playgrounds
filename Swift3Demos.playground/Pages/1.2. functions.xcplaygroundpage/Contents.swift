// 5 mins

func sayHello1()
{
    print( "Hello" )
}

// add "who" (note argument labels)

// then add "greeting"

// show how labels can be supressed

func sayHello2( _ greeting : String, _ who : String )
{
    print( "\(greeting) \(who)" )
}

sayHello2("hello", "world" )
sayHello2("goodbye cruel", "world" )
