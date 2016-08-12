import Foundation

enum QueryError : Error {
    case UrlError
    case NetworkError
    case JSONError
}

func suggestQueries( searchString : String ) throws -> [String] {
    let qs = ("client=firefox&q=" + searchString).addingPercentEncoding( withAllowedCharacters: NSCharacterSet.urlQueryAllowed )!
    let requestString = "http://suggestqueries.google.com/complete/search?" + qs
    
    guard let url = URL( string: requestString ) else {
        throw QueryError.UrlError
    }
    
    guard let data = NSData( contentsOf: url as URL ) else {
        throw QueryError.NetworkError
    }
    
    guard let json = try JSONSerialization.jsonObject(with: data as Data, options: .allowFragments ) as? NSArray else {
        throw QueryError.JSONError
    }
    guard let result = json[1] as? [String] else {
        throw QueryError.JSONError
    }
    return result
}

do {
    try suggestQueries( searchString: "why does trump")
}
catch let err as QueryError {
    print( "QueryError: \(err)!" )
}
catch {
    print( "Error!" )
}

let results = try? suggestQueries( searchString: "why does trump" )
