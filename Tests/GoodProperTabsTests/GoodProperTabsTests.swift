import XCTest
import SwiftUI
@testable import GoodProperTabs

final class GoodProperTabsViewTests: XCTestCase {
    
    func testInitWithContent() throws {
        // Given: Some sample tabs
        let sampleContent = [
            (title: "Tab 1", icon: "someCustomIcon", view: AnyView(Text("Tab #1"))),
            (title: "Tab 2", icon: "system:apple.logo", view: AnyView(Text("Tab #2"))),
            (title: "Tab 3", icon: "system:apple.logo", view: AnyView(Text("Tab #3")))
        ]
        
        // When: We create the GoodProperTabsView
        let tabsView = GoodProperTabsView(content: sampleContent)
        
        // Then: We can do a few checks
        
        // 1) Reflection-based check (titles and icons are private, so we have to reflect)
        let mirror = Mirror(reflecting: tabsView)
        
        // Extract the "titles" property via reflection
        if let titlesChild = mirror.children.first(where: { $0.label == "titles" })?.value as? [String] {
            XCTAssertEqual(titlesChild.count, sampleContent.count, "Number of titles should match content count")
            XCTAssertEqual(titlesChild.first, "Tab 1", "First title should be 'Tab 1'")
        } else {
            XCTFail("Could not reflect titles property from GoodProperTabsView")
        }
        
        // Extract the "icons" property
        if let iconsChild = mirror.children.first(where: { $0.label == "icons" })?.value as? [String] {
            XCTAssertEqual(iconsChild[1], "system:apple.logo", "Second icon should be 'system:apple.logo'")
        } else {
            XCTFail("Could not reflect icons property from GoodProperTabsView")
        }
    }
    
    func testInitialSelection() throws {
        // Given: Some sample tabs
        let sampleContent = [
            (title: "Tab 1", icon: "someCustomIcon", view: AnyView(Text("Tab #1"))),
            (title: "Tab 2", icon: "system:apple.logo", view: AnyView(Text("Tab #2")))
        ]
        
        // When: We create the GoodProperTabsView
        let tabsView = GoodProperTabsView(content: sampleContent)
        
        // Then: Check that the default selection is 0 (first tab)
        let mirror = Mirror(reflecting: tabsView)
        if let selectionState = mirror.children.first(where: { $0.label == "_selection" })?.value as? State<Int> {
            let currentValue = selectionState.wrappedValue
            XCTAssertEqual(currentValue, 0, "Default selection should be 0")
        } else {
            XCTFail("Could not reflect _selection property from GoodProperTabsView")
        }

    }
}
