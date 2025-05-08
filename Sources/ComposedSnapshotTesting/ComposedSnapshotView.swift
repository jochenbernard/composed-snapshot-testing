import SwiftUI

struct ComposedSnapshotView: View {
    let snapshots: [(String, UIImage)]

    private let spacing = 16.0

    var body: some View {
        HStack(
            alignment: .top,
            spacing: spacing
        ) {
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
        .padding(spacing)
        .padding(.vertical, 12.0)
        .background(Color.black)
    }
}
