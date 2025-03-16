////
//  TestZoomAndFullScreen15_4
//  AppDelegate
//
//  Created by LegoEsprit on 08.03.25.
//  Copyright (c) 2025 LegoEsprit
//

import Cocoa

let ignored = 0.0

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var laverBasedWindow: NSWindow!
    

    func applicationDidFinishLaunching(_ aNotification: Notification) {
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        NSApplication.shared.terminate(self)
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        true
    }
    
    
}

