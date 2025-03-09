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
    
    @IBOutlet weak var resizingLayerView: ResizingLayerView!
    
}

extension LayerBasedViewController: NSWindowDelegate {
    
    func windowWillResize(
        _ sender: NSWindow,
        to frameSize: NSSize
    ) -> NSSize {
        resizingLayerView.willResize()
        return frameSize
    }
    
    func windowDidExitFullScreen(_ notification: Notification) {
        resizingLayerView.willResize(suppressImpicitAnimation: false)
    }
    
    func windowDidEnterFullScreen(_ notification: Notification) {
        resizingLayerView.willResize(suppressImpicitAnimation: false)
    }

}

