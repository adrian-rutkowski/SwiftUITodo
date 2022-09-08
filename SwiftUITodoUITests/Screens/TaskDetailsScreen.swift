import XCTest

struct TaskDetailsScreen: Screen {
    let app: XCUIApplication
    
    fileprivate enum Identifiers {
        static let backButtonId = "Tasks 👀"
        static let editTextFieldId = "edit_task_textfield"
    }
    
    var backButton: XCUIElement {app.buttons[Identifiers.backButtonId].firstMatch}
    var editTextField: XCUIElement {app.textFields[Identifiers.editTextFieldId].firstMatch}
    
    func editTask(_ taskText: String) -> Self {
        editTextField.tap()
        sleep(1)
        editTextField.tap()
        Keyboard.tap(.selectAll)
        Keyboard.tap(.delete)
        editTextField.typeText(taskText)
        Keyboard.tap(.Return)
        return self
    }
    
    func tapBackButton() -> TaskListScreen {
        backButton.tap()
        return TaskListScreen(app: app)
    }
}
