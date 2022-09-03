import XCTest

class UserFlowTests: UITestCase {
    func testAddNewTask() {
        let taskName = "new task"
        TaskListScreen(app: app)
            .addNewTask(taskName)
            .verifyIfTaskIsOnTheList(taskName, onTheList: true)
    }
    
    func testMarkTaskAsCompleted() {
        
    }
    
    func testDeleteTask() {
        
    }
    
    func testEditTask() {
        
    }
}
