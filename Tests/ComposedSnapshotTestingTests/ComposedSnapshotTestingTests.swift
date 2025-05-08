import SwiftUI
import Testing
import SnapshotTesting
import AsyncSnapshotTesting
@testable import ComposedSnapshotTesting

@MainActor
@Suite(.snapshots(record: .failed))
struct ComposedSnapshotTestingTests {
    @Test
    @available(iOS 15.0, *)
    func testPhoneSnapshot() {
        assertSnapshot(
            of: TestView(),
            as: .image(on: .iPhoneSe)
        )
    }

    @Test
    @available(iOS 15.0, *)
    func testPadSnapshot() {
        assertSnapshot(
            of: TestView(),
            as: .image(on: .iPadPro12_9)
        )
    }

    @Test
    @available(iOS 15.0, *)
    func testComposedSnapshot() async {
        await assertAsyncSnapshot(
            of: TestView(),
            as: .image(on: [.iPhoneSe, .iPadPro12_9])
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
