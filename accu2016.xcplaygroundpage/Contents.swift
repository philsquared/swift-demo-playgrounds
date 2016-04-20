import Foundation

enum QueryError : ErrorType {
    case UrlError
    case NetworkError
    case JSONError
}

func suggestQueries( searchString : String ) throws -> [String] {
    let qs = ("client=firefox&q=" + searchString).stringByAddingPercentEncodingWithAllowedCharacters( NSCharacterSet.URLQueryAllowedCharacterSet() )!
    let requestString = "http://suggestqueries.google.com/complete/search?" + qs
    
    guard let url = NSURL( string: requestString ) else {
        throw QueryError.UrlError
    }
    
    guard let data = NSData( contentsOfURL: url ) else {
        throw QueryError.NetworkError
    }
    
    guard let json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments ) as? NSArray else {
        throw QueryError.JSONError
    }
    guard let result = json[1] as? [String] else {
        throw QueryError.JSONError
    }
    return result
}

do {
    try suggestQueries( "swift is good for")
}
catch let err as QueryError {
    print( "QueryError: \(err)!" )
}
catch {
    print( "Error!" )
}

let results = try? suggestQueries( "exceptions are")
