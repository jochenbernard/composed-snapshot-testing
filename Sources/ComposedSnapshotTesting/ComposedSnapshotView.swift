import SwiftUI

struct ComposedSnapshotView: View {
    let snapshots: [(String, UIImage)]
    let layout: ComposedSnapshotLayout

    private let spacing = 16.0

    var body: some View {
        layoutView
            .padding(spacing)
            .background(Color.black)
            .fixedSize()
    }

    @ViewBuilder
    private var layoutView: some View {
        switch layout {
        case .horizontal(let alignment):
            HStack(
                alignment: alignment,
                spacing: spacing
            ) {
                snapshotViews
            }
        case .vertical(let alignment):
            VStack(
                alignment: alignment,
                spacing: spacing
            ) {
                snapshotViews
            }
        }
    }

    private var snapshotViews: some View {
        ForEach(
            Array(snapshots.enumerated()),
            id: \.offset
        ) { _, snapshot in
            VStack(spacing: spacing) {
                Text(snapshot.0)
                    .font(.headline)
                    .foregroundColor(.white)

                Image(uiImage: snapshot.1)
            }
        }
    }
}
