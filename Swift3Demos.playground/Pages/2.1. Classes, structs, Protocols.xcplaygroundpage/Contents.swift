import Foundation

// SessionType/ SessionLen from prev demo
enum SessionLen {
    case _15
    case _45
    case _90
}

// conform to protocol
enum SessionType {
    case Keynote
    case TrackSession(SessionLen)
    case LightningTalk
}

func talkLen( _ len : SessionLen ) -> Int {
    switch len {
    case ._15: return 15
    case ._45: return 45
    case ._90: return 90
    }
}

func talkLen( _ session : SessionType ) -> Int {
    switch session {
    case .Keynote: return 60
    case .TrackSession(let len): return talkLen(len)
    case .LightningTalk: return 5
    }
}

let talk = SessionType.TrackSession(._45)
talkLen( talk )

// ...

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

func makeDate( string : String ) -> Date? {
    let dateStringFormatter = DateFormatter()
    dateStringFormatter.dateFormat = "yyyy-MM-dd"
    dateStringFormatter.locale = Locale(identifier: "en_US_POSIX")
    return dateStringFormatter.date(from: string)
}

// copy in direct code (above), then refactor to extension
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

session.date = Date(string: "2016-09-07")
session.date


