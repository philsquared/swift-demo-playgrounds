import Foundation

struct SessionInfo {
    let type : SessionType
    let title : String
    let presenter : String
}
class Session {
    let info : SessionInfo
    var date : Date?
    
    init( info : SessionInfo ) {
        self.info = info
    }
}

let swiftSessionInfo = SessionInfo( type: .TrackSession(._90), title: "Swift For The Curious", presenter: "Phil Nash" )

let session = Session( info: swiftSessionInfo )

// copy in direct code, then refactor to extension
extension Date {
    init?( string : String ) {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        dateStringFormatter.locale = Locale(identifier: "en_US_POSIX")
        if let date = dateStringFormatter.date(from: string) {
            self.init(timeInterval:0, since:date)
        }
        else {
            return nil
        }
    }
}

// add this as convenience
extension Session : CustomStringConvertible {
    var description : String {
        return "'\(info.title)' - \(info.presenter) (\(info.type))"
    }
}
print (session)
session.date = Date(string: "2016-04-20")
session.date


