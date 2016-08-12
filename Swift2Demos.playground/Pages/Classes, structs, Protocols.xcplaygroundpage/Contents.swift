import Foundation

struct SessionInfo {
    let type : SessionType
    let title : String
    let presenter : String
}
class Session {
    let info : SessionInfo
    var date : NSDate?
    
    init( info : SessionInfo ) {
        self.info = info
    }
}

let swiftSessionInfo = SessionInfo( type: .TrackSession(._90), title: "Swift For The Curious", presenter: "Phil Nash" )

let session = Session( info: swiftSessionInfo )

// copy in direct code, then refactor to extension
extension NSDate {
    convenience init?( dateString : String ) {
        let dateStringFormatter = NSDateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        if let date = dateStringFormatter.dateFromString(dateString) {
            self.init(timeInterval:0, sinceDate:date)
        }
        else {
            self.init()
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
session.date = NSDate(dateString: "2016-04-20")
session.date


