import SwiftUI
import SnapshotTesting
import AsyncSnapshotTesting

public extension AsyncSnapshotting where Value: View, Format == UIImage {
    static func image(
        on configs: [(String, ViewImageConfig)],
        layout: ComposedSnapshotLayout = .horizontal(alignment: .top),
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
            let snapshots = await withTaskGroup(
                of: (Int, UIImage).self,
                returning: [(String, UIImage)].self
            ) { taskGroup in
                for config in configs.enumerated() {
                    taskGroup.addTask {
                        let snapshot = await Snapshotting.image(
                            on: config.element.1,
                            drawHierarchyInKeyWindow: drawHierarchyInKeyWindow,
                            precision: precision,
                            perceptualPrecision: perceptualPrecision,
                            size: size,
                            traits: traits
                        )
                        .snapshot(value)
                        .run()

                        return (config.offset, snapshot)
                    }
                }

                var snapshots = Array<(String, UIImage)?>(
                    repeating: nil,
                    count: configs.count
                )
                for await snapshot in taskGroup {
                    snapshots[snapshot.0] = (configs[snapshot.0].0, snapshot.1)
                }
                return snapshots.compactMap(\.self)
            }

            return await snapshotting.snapshot(
                ComposedSnapshotView(
                    snapshots: snapshots,
                    layout: layout
                )
            )
            .run()
        }
    }
}
