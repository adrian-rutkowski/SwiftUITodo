import XCTest

struct TaskListScreen: Screen {
    let app: XCUIApplication
    
    fileprivate enum Identifiers {
        static let doneButtonId = "done_button"
        static let editButtonId = "edit_button"
        static let newTaskFieldId = "create_new_task_textfield"
        static let doneCheckmarkId = "done_checkmark"
        static let deleteButtonId = "delete_button"
        static let taskDetailsButtonId = "Forward"
    }
    
    var newTaskField: XCUIElement {app.textFields[Identifiers.newTaskFieldId].firstMatch}
    var editButton: XCUIElement {app.buttons[Identifiers.editButtonId].firstMatch}
    var doneButton: XCUIElement {app.buttons[Identifiers.doneButtonId].firstMatch}
    func findTask(_ taskName: String) -> XCUIElement {app.buttons["\(taskName)"].firstMatch}
    func isCompleteCheckmark(_ taskName: String) -> XCUIElement {app.cells.containing(.button, identifier: "\(taskName)").images[Identifiers.doneCheckmarkId].firstMatch}
    func deleteTaskButton(_ taskName: String) -> XCUIElement {app.cells.containing(.button, identifier: "\(taskName)").images[Identifiers.deleteButtonId].firstMatch}
    func taskDetailsButton(_ taskName: String) -> XCUIElement {app.cells.containing(.button, identifier: "\(taskName)").images[Identifiers.taskDetailsButtonId].firstMatch}
    
    func addNewTask(_ taskName: String) -> Self {
        newTaskField.tap()
        newTaskField.typeText(taskName)
        Keyboard.tap(.Return)
        return self
    }
    
    func tapOnTask(_ taskName: String) -> Self {
        findTask(taskName).tap()
        return self
    }
    
    func tapEditButton() -> Self {
        editButton.tap()
        return self
    }
    
    func tapDoneButton() -> Self {
        doneButton.tap()
        return self
    }
    
    func tapDeleteTaskButton(_ taskName: String) -> Self {
        deleteTaskButton(taskName).tap()
        return self
    }
    
    func tapTaskDetailsButton(_ taskName: String) -> TaskDetailsScreen {
        taskDetailsButton(taskName).tap()
        return TaskDetailsScreen(app: app)
    }
    
    func verifyIfTaskIsOnTheList(_ taskName: String, onTheList: Bool) -> Bool {
        if onTheList == true {
            return findTask(taskName).waitUntilDisplayed()
        } else {
            return !findTask(taskName).waitUntilDisplayed()
        }
    }
    
    func verifyIfTaskIsComplete(_ taskName: String, isComplete: Bool) -> Bool {
        if isComplete == true {
            return isCompleteCheckmark(taskName).exists
        } else {
            return !isCompleteCheckmark(taskName).exists
        }
    }
}
