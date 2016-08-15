/// 15-20 mins
enum SessionLength {
    case _15
    case _45
    case _90
    
    var duration : Int
    {
        switch self {
        case ._15: return 15
        case ._45: return 45
        case ._90: return 90
        }
    }
}

enum SessionType : CustomStringConvertible {
    //case PreconfTutorial
    case Keynote
    case TrackSession(SessionLength)
    case LightningTalk
    
    var duration : Int {
        switch self {
        //case .PreconfTutorial: return 300
        case .Keynote: return 60
        case .TrackSession(let len): return len.duration
        case .LightningTalk: return 5
        }
    }
    
    var description : String {
        switch self {
        //case .PreconfTutorial: return "pre-conference tutorial"
        case .Keynote: return "Keynote"
        case .TrackSession: return "\(self.duration) minute track session"
        case .LightningTalk: return "lightning talk"
        }
    }
}

let talk = SessionType.Keynote


print( "\(talk)" )
SessionType.TrackSession(._45)


SessionType.LightningTalk.duration
SessionType.Keynote.duration

SessionType.TrackSession( ._15 ).duration
SessionType.TrackSession( ._45 ).duration
SessionType.TrackSession( ._90 ).duration
