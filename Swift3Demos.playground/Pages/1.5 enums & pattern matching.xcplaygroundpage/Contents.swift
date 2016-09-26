// 5 mins
enum SessionLen {
    case _15
    case _45
    case _90
}

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