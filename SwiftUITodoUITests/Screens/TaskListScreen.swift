import XCTest

struct TaskListScreen: Screen {
    let app: XCUIApplication
    
    private enum Identifiers {
        static let doneButton = "done_button"
        static let editButton = "edit_button"
        static let newTaskField = "create_new_task_textfield"
        static let doneCheckmark = "done_checkmark"
        static let deleteButton = "delete_button"
        static let taskDetailsButton = "task_details_button"
    }
    
    func addNewTask(_ taskName: String) -> Self {
        let field = app.textFields[Identifiers.newTaskField].firstMatch
        field.tap()
        field.typeText(taskName)
        app.keyboards.buttons["Return"].tap()
        return self
    }
    
    func verifyIfTaskIsOnTheList(_ taskName: String, onTheList: Bool) -> Self {
        if onTheList == true {
            XCTAssertTrue(app.cells["\(taskName)"].exists)
        } else {
            XCTAssertTrue(!app.cells["\(taskName)"].exists)
        }
        return self
    }
}
