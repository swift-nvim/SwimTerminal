import Surface

public enum SwimTerminalInput:
    Sendable,
    Codable,
    Hashable
{
    case input(SurfaceInput.Key)
    case paste(String)
}

public enum SwimTerminalInputAdapter {
    /// The editor's view of a decoded event: control strokes fold into chords
    /// (`stroke.chord`), pointer events become an empty `unknown`.
    public static func adapt(
        _ event: SurfaceInput
    ) -> SwimTerminalInput {
        switch event {
        case .pointer:
            return .input(
                .unknown([])
            )

        case .key(let key):
            return .input(
                key
            )

        case .stroke(let stroke):
            return .input(
                stroke.chord
            )

        case .paste(let text):
            return .paste(
                text
            )
        }
    }
}
