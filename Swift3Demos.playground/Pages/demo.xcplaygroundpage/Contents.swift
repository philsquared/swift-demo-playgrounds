import Foundation

enum QueryError : ErrorType {
    case MalformedURL
    case NetworkFailure
    case InvalidResponse
}

func suggest( searchString : String ) throws -> [String] {
    let qs = ("client=firefox&q=" + searchString).stringByAddingPercentEncodingWithAllowedCharacters( NSCharacterSet.URLQueryAllowedCharacterSet() )!
    let requestString = "http://suggestqueries.google.com/complete/search?" + qs

    guard let url = NSURL( string: requestString ) else {
        throw QueryError.MalformedURL
    }

    guard let data = NSData( contentsOfURL: url ) else {
        throw QueryError.NetworkFailure
    }

    guard let json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments ) as? NSArray else {
        throw QueryError.InvalidResponse
    }

    guard let results = json[1] as? [String] else {
        throw QueryError.InvalidResponse
    }
    return results
}

do {
    try suggest( "swift is good for" )
}
catch QueryError.NetworkFailure {
    print( "network failure")
}
catch {
    print( "Error")
}

let result = try? suggest( "blah blah" )
