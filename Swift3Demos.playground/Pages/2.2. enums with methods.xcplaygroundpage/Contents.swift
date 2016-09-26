import Foundation

// SessionType/ SessionLen from prev demo

// (add duration and description methods)

enum SessionLen {
    case _15
    case _45
    case _90
    
    // Add duration property *********
    var duration : Int {
        switch self {
        case ._15: return 15
        case ._45: return 45
        case ._90: return 90
        }
    }
}

// conform to protocol ******
enum SessionType : CustomStringConvertible {
    case Keynote
    case TrackSession(SessionLen)
    case LightningTalk
    
    // Add duration property ********
    var duration : Int {
        switch self {
        case .Keynote: return 60
        case .TrackSession(let len): return len.duration
        case .LightningTalk: return 5
        }
    }
    
    // Add description property (from protocol)
    var description : String {
        switch self {
        case .Keynote: return "Keynote"
        case .TrackSession(let len): return "\(len.duration) minute Track Session"
        case .LightningTalk: return "Lightning Talk"
        }
        
    }
}


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

// *********
// add this as convenience
extension Session : CustomStringConvertible {
    var description : String {
        return "'\(info.title)' - \(info.presenter) (\(info.type))"
    }
}
print (session)


