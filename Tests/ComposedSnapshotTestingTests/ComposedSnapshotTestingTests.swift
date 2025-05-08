import SwiftUI
import Testing
import SnapshotTesting
import AsyncSnapshotTesting
import ComposedSnapshotTesting

@MainActor
@Suite(.snapshots(record: .failed))
struct ComposedSnapshotTestingTests {
    @Test
    @available(iOS 15.0, *)
    static func testPhoneSnapshot() {
        assertSnapshot(
            of: TestView(),
            as: .image(on: .iPhoneSe)
        )
    }

    @Test
    @available(iOS 15.0, *)
    static func testPadSnapshot() {
        assertSnapshot(
            of: TestView(),
            as: .image(on: .iPadPro12_9)
        )
    }

    @Test(arguments: layouts)
    @available(iOS 15.0, *)
    static func testComposedSnapshot(layout: ComposedSnapshotLayout) async {
        await assertAsyncSnapshot(
            of: TestView(),
            as: .image(
                on: [
                    ("iPhone SE", .iPhoneSe),
                    ("iPad Pro 12.9\"", .iPadPro12_9)
                ],
                layout: layout
            ),
            named: String(describing: layout)
        )
    }

    static let layouts: [ComposedSnapshotLayout] = [
        .horizontal(alignment: .top),
        .horizontal(alignment: .center),
        .horizontal(alignment: .bottom),
        .vertical(alignment: .leading),
        .vertical(alignment: .center),
        .vertical(alignment: .trailing)
    ]

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
