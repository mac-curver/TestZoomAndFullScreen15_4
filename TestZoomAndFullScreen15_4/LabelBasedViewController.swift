////
//  TestZoomAndFullScreen15_4
//  ViewController
//
//  Created by LegoEsprit on 08.03.25.
//  Copyright (c) 2025 LegoEsprit
//

import AppKit

class LabelBasedViewController: NSViewController {
    
    @IBOutlet weak var resizingLabel: NSTextField!
    
}

extension LabelBasedViewController: NSWindowDelegate {
    
    func windowWillResize(
        _ sender: NSWindow,
        to frameSize: NSSize
    ) -> NSSize {
        if let fontName = resizingLabel.font?.fontName {
            resizingLabel.font = NSFont(name: fontName, size: frameSize.height * 200/360)
        }
        return frameSize
    }
    
}
