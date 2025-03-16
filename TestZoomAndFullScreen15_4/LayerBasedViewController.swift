////
//  TestZoomAndFullScreen15_4
//  LayerBasedViewController
//
//  Created by LegoEsprit on 09.03.25.
//  Copyright (c) 2025 LegoEsprit
//

import AppKit
import os.log

class LayerBasedViewController: NSViewController {
    
    var normalFrame: NSRect = .zero
    var normalStyle: NSWindow.StyleMask = []

    @IBOutlet weak var resizingLayerView: ResizingLayerView!
    
    var window: NSWindow {
        resizingLayerView.window ?? NSWindow()
    }
    
    override func viewDidLoad() {
        normalFrame = window.frame
        normalStyle = window.styleMask
    }
        
}

extension LayerBasedViewController: NSWindowDelegate {
    

        
    func windowWillEnterFullScreen(_ notification: Notification) {
        Logger.write(window.styleMask.debugString)
        resizingLayerView.toFullScreen = true
    }
    
    func windowDidEnterFullScreen(_ notification: Notification) {
        Logger.write(window.styleMask.debugString)
        resizingLayerView.toFullScreen = false
    }
    
    func windowWillExitFullScreen(_ notification: Notification) {
        Logger.write(window.styleMask.debugString)
    }
    
    func windowDidExitFullScreen(_ notification: Notification) {
        Logger.write(window.styleMask.debugString)
    }
    
    func customWindowsToEnterFullScreen(for window: NSWindow) -> [NSWindow]? {
        Logger.write(window.title)
        return [window]
    }
    

    func window(_ window: NSWindow, startCustomAnimationToEnterFullScreenWithDuration: TimeInterval) {
        Logger.login(String(format: "%6.3f", startCustomAnimationToEnterFullScreenWithDuration))
        if let fullScreenFrame = window.screen?.frame {
            normalFrame = window.frame
            NSAnimationContext.runAnimationGroup { context in
                context.duration = startCustomAnimationToEnterFullScreenWithDuration
                window.animator().setFrame(fullScreenFrame, display: true)
            }
        }
        Logger.logout("")
    }
    
    func customWindowsToExitFullScreen(for window: NSWindow) -> [NSWindow]? {
        Logger.write(window.title)
        return [window]
    }

    
    func window(_ window: NSWindow, startCustomAnimationToExitFullScreenWithDuration: TimeInterval) {
        Logger.login(String(format: "%6.3f", startCustomAnimationToExitFullScreenWithDuration))
        window.styleMask = normalStyle
        NSAnimationContext.runAnimationGroup { context in
            context.duration = startCustomAnimationToExitFullScreenWithDuration
            window.animator().setFrame(normalFrame, display: true)
        }
        Logger.logout("")
    }
    
}


