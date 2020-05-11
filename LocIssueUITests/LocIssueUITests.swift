
import XCTest

class LocIssueUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLocation() throws {
        let app = XCUIApplication()
        app.launch()
        
        let handler = addUIInterruptionMonitor(withDescription: "Location") { (alert) in
            let location = NSPredicate(format: "label CONTAINS 'location'")
            if alert.staticTexts.element(matching: location).exists {
                alert.buttons["Allow While Using App"].tap()
                return true
            }
            return false
        }

        sleep(3)
        app.tap()
        
        let result = app.staticTexts["LOCATION FOUND"].waitForExistence(timeout: 3)
        XCTAssertTrue(result)
        
        removeUIInterruptionMonitor(handler)
    }
    

    func testErrorString() throws {
        let app = XCUIApplication()
        app.launch()
        
        let handler = addUIInterruptionMonitor(withDescription: "Location") { (alert) in
            let location = NSPredicate(format: "label CONTAINS 'location'")
            if alert.staticTexts.element(matching: location).exists {
                alert.buttons["Allow While Using App"].tap()
                return true
            }
            return false
        }

        sleep(3)
        app.tap()
        
        let result = app.staticTexts["ERROR FOUND"].waitForExistence(timeout: 3)
        XCTAssertFalse(result)

        removeUIInterruptionMonitor(handler)
    }
}
