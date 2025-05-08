import SwiftUI

struct ComposedSnapshotView: View {
    let snapshots: [UIImage]

    var body: some View {
        Image(uiImage: snapshots.first!)
    }
}
