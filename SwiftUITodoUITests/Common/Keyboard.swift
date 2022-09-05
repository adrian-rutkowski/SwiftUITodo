import Foundation
import XCTest

struct Keyboard {
    enum Key: String {
        case done = "Done"
        case delete = "delete"
        case Delete = "Delete"
        case Return = "Return"

        var query: XCUIElementQuery {
            switch self {
            case .done:
                return XCUIApplication().buttons
            case .delete:
                return XCUIApplication().keys
            case .Delete:
                return XCUIApplication().keys
            case .Return:
                return XCUIApplication().buttons
            }
        }
    }

    static func tap(_ key: Key) {
        key.query[key.rawValue].firstMatch.tap()
    }

    func keypadEntry(keypadEntryValue: String) {
        for num in String(keypadEntryValue) {
            XCUIApplication().keys[String(num)].tap()
        }
    }
}

