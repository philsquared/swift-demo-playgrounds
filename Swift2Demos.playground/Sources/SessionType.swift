public enum SessionLength {
    case _15
    case _45
    case _90
    
    public var duration : Int
    {
        switch self {
        case ._15: return 15
        case ._45: return 45
        case ._90: return 90
        }
    }
}

public enum SessionType : CustomStringConvertible {
    case PreconfTutorial
    case Keynote
    case TrackSession(SessionLength)
    case LightningTalk
    
    public var duration : Int {
        switch self {
        case .PreconfTutorial: return 300
        case .Keynote: return 60
        case .TrackSession(let len): return len.duration
        case .LightningTalk: return 5
        }
    }
    
    public var description : String {
        switch self {
        case .PreconfTutorial: return "pre-conference tutorial"
        case .Keynote: return "Keynote"
        case .TrackSession: return "\(self.duration) minute track session"
        case .LightningTalk: return "lightning talk"
        }
    }
}
