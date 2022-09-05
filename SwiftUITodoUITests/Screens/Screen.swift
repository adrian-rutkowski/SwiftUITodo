import XCTest

protocol Screen {
    var app: XCUIApplication { get }
}

extension Screen {
    
    @discardableResult
    func scrollToElement(_ element: XCUIElement) -> Self {
        while !element.isVisible { app.swipeUp() }
        return self
    }
    
    @discardableResult
    func assertIsDisplayed(_ element: XCUIElement) -> Self {
        XCTAssertTrue(element.isVisible)
        return self
    }
    
    @discardableResult
    func assert(_ expression: @escaping (Self) -> Bool, _ message: String = "", file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssert(expression(self), message, file: file, line: line)
        return self
    }
    
    @discardableResult
    func assert(_ keyPath: KeyPath<Self, Bool>, _ message: String = "", file: StaticString = #filePath, line: UInt = #line) -> Self {
        assert(keyPath, equals: true, message, file: file, line: line)
    }
    
    @discardableResult
    func assert<Value: Equatable>(_ keyPath: KeyPath<Self, Value>, equals expectation: Value, _ message: String = "", file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssert(self[keyPath: keyPath] == expectation, message, file: file, line: line)
        return self
    }
}
