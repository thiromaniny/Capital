//
//  HW7UITestsLaunchTests.swift
//  HW7UITests
//
//  Created by sam on 8/8/24.
//

import XCTest

// Defines a test case class for UI tests related to the launch of the HW7 app.
final class HW7UITestsLaunchTests: XCTestCase {

    // Indicates whether the test suite runs once for each UI configuration of the target application.
    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true // Runs the tests for each target application UI configuration.
    }

    // Sets up the initial conditions for each test, called before the invocation of each test method.
    override func setUpWithError() throws {
        // Stop executing further tests if a failure occurs.
        continueAfterFailure = false
    }

    // Defines a test method to verify that the application launches correctly.
    func testLaunch() throws {
        // Creates an instance of the application being tested.
        let app = XCUIApplication()
        // Launches the application.
        app.launch()

        // Insert steps here to perform after the app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app.

        // Captures a screenshot of the current screen.
        let attachment = XCTAttachment(screenshot: app.screenshot())
        // Names the screenshot as "Launch Screen."
        attachment.name = "Launch Screen"
        // Ensures the screenshot is kept and not deleted after the test finishes.
        attachment.lifetime = .keepAlways
        // Adds the screenshot attachment to the test case.
        add(attachment)
    }
}

