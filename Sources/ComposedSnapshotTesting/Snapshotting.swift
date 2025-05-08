import SwiftUI
import SnapshotTesting

public extension Snapshotting where Value: View, Format == UIImage {
    static func image(
        on config: ViewImageConfig,
        drawHierarchyInKeyWindow: Bool = false,
        precision: Float = 1,
        perceptualPrecision: Float = 1,
        size: CGSize? = nil,
        traits: UITraitCollection = .init()
    ) -> Snapshotting {
        .image(
            drawHierarchyInKeyWindow: drawHierarchyInKeyWindow,
            precision: precision,
            perceptualPrecision: perceptualPrecision,
            layout: size.map({ .fixed(width: $0.width, height: $0.height) }) ?? .device(config: config),
            traits: config.traits
        )
    }
}
