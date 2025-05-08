import SwiftUI
import SnapshotTesting
import AsyncSnapshotTesting

public extension AsyncSnapshotting where Value: View, Format == UIImage {
    static func image(
        on configs: [ViewImageConfig],
        drawHierarchyInKeyWindow: Bool = false,
        precision: Float = 1,
        perceptualPrecision: Float = 1,
        size: CGSize? = nil,
        traits: UITraitCollection = .init()
    ) -> AsyncSnapshotting {
        let snapshotting = Snapshotting<ComposedSnapshotView, UIImage>.image(
            drawHierarchyInKeyWindow: drawHierarchyInKeyWindow,
            precision: precision,
            perceptualPrecision: perceptualPrecision,
            traits: traits
        )
        return AsyncSnapshotting(
            pathExtension: snapshotting.pathExtension,
            diffing: snapshotting.diffing
        ) { value in
            let image = await Snapshotting.image(
                on: configs.first!,
                drawHierarchyInKeyWindow: drawHierarchyInKeyWindow,
                precision: precision,
                perceptualPrecision: perceptualPrecision,
                size: size,
                traits: traits
            )
            .snapshot(value)
            .run()

            return await snapshotting.snapshot(
                ComposedSnapshotView(
                    snapshots: [image]
                )
            )
            .run()
        }
    }
}
