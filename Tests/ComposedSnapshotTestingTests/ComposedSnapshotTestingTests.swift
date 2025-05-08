import SwiftUI
import Testing
import SnapshotTesting
@testable import ComposedSnapshotTesting

@Suite(.snapshots(record: .failed))
struct ComposedSnapshotTestingTests {
    @MainActor @Test
    @available(iOS 15.0, *)
    func testSnapshotPhone() {
        assertSnapshot(
            of: TestView(),
            as: .image(on: .iPhoneSe)
        )
    }

    @MainActor @Test
    @available(iOS 15.0, *)
    func testSnapshotPad() {
        assertSnapshot(
            of: TestView(),
            as: .image(on: .iPadPro12_9)
        )
    }

    @available(iOS 15.0, *)
    struct TestView: View {
        var body: some View {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)

                Text("Hello, world!")
            }
            .padding()
        }
    }
}
