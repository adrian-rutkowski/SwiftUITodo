import XCTest

struct TaskListScreen: Screen {
    let app: XCUIApplication
    
    private enum Identifiers {
        static let doneButtonId = "done_button"
        static let editButtonId = "edit_button"
        static let newTaskFieldId = "create_new_task_textfield"
        static let doneCheckmarkId = "done_checkmark"
        static let deleteButtonId = "delete_button"
        static let taskDetailsButtonId = "task_details_button"
    }
    
    var newTaskField: XCUIElement {app.textFields[Identifiers.newTaskFieldId].firstMatch}
    
    func addNewTask(_ taskName: String) -> Self {
        newTaskField.tap()
        newTaskField.typeText(taskName)
        Keyboard.tap(.Return)
        return self
    }
    
    func verifyIfTaskIsOnTheList(_ taskName: String, onTheList: Bool) -> Bool {
        if onTheList == true {
            return app.cells["\(taskName)"].waitUntilDisplayed()
        } else {
            return !app.cells["\(taskName)"].waitUntilDisplayed()
        }
    }
}
