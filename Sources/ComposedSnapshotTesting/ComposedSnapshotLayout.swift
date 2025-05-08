import SwiftUI

public enum ComposedSnapshotLayout: CustomDebugStringConvertible {
    case horizontal(alignment: VerticalAlignment)
    case vertical(alignment: HorizontalAlignment)

    public var debugDescription: String {
        switch self {
        case .horizontal(let alignment):
            "horizontal(\(debugDescription(alignment)))"
        case .vertical(let alignment):
            "vertical(\(debugDescription(alignment)))"
        }
    }

    private func debugDescription(_ alignment: VerticalAlignment) -> String {
        switch alignment {
        case .top:
            "top"
        case .center:
            "center"
        case .bottom:
            "bottom"
        default:
            ""
        }
    }

    private func debugDescription(_ alignment: HorizontalAlignment) -> String {
        switch alignment {
        case .leading:
            "leading"
        case .center:
            "center"
        case .trailing:
            "trailing"
        default:
            ""
        }
    }
}
