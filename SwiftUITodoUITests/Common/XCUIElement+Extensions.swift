import Foundation
import XCTest

extension XCUIElement {
    var isVisible: Bool {
        guard exists, !frame.isEmpty else { return false }
        return XCUIApplication().windows.element(boundBy: 0).frame.contains(frame)
    }

    @discardableResult
    func waitUntilDisplayed(timeout: TimeInterval = 3) -> Bool {
        waitForExistence(timeout: timeout)
    }
}
