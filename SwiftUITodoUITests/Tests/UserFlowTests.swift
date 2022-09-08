import XCTest

class UserFlowTests: UITestCase {
    func testAddNewTask() {
        let taskName = "new task"
        TaskListScreen(app: app)
            .addNewTask(taskName)
            .assert { $0.verifyIfTaskIsOnTheList(taskName, onTheList: true)}
    }
    
    func testMarkTaskAsCompleted() {
        let taskName = "task to complete"
        TaskListScreen(app: app)
            .addNewTask(taskName)
            .tapOnTask(taskName)
            .assert { $0.verifyIfTaskIsComplete(taskName, isComplete: true)}
    }
    
    func testMarkTaskAsNotCompleted() {
        let taskName = "Watch WWDC19 Keynote 🎉"
        TaskListScreen(app: app)
            .tapOnTask(taskName)
            .assert { $0.verifyIfTaskIsComplete(taskName, isComplete: false)}
    }
    
    func testDeleteTask() {
        let taskName = "Read SwiftUI Documentation 📚"
        TaskListScreen(app: app)
            .tapEditButton()
            .tapDeleteTaskButton(taskName)
            .assert { $0.verifyIfTaskIsOnTheList(taskName, onTheList: false)}
    }
    
    func testEditTask() {
        let taskName = "task to edit"
        let taskEdit = "edited task"
        TaskListScreen(app: app)
            .addNewTask(taskName)
            .tapEditButton()
            .tapTaskDetailsButton(taskName)
            .editTask(taskEdit)
            .tapBackButton()
            .tapDoneButton()
            .assert { $0.verifyIfTaskIsOnTheList(taskEdit, onTheList: true)}
    }
}
