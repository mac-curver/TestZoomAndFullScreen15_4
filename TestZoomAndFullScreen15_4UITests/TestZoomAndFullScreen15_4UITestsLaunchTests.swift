////
//  TestZoomAndFullScreen15_4UITests
//  TestZoomAndFullScreen15_4UITestsLaunchTests
//
//  Created by LegoEsprit on 08.03.25.
//  Copyright (c) 2025 LegoEsprit
//

import XCTest

final class TestZoomAndFullScreen15_4UITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
