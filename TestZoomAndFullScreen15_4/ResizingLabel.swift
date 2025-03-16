////
//  TestZoomAndFullScreen15_4
//  ResizingLabel
//
//  Created by LegoEsprit on 13.03.25.
//  Copyright (c) 2025 LegoEsprit
//

import AppKit

class ResizingLabel: NSTextField {
    
    var sizeRatio = 0.8
    
    override func awakeFromNib() {
        if let font = font {
            // copy it from original IB setting
            sizeRatio = font.pointSize / bounds.height
        }
    }
    
    
    /// Resize fontsize according to frame
    /// - Parameter oldSize: Ignored
    override func resize(withOldSuperviewSize oldSize: NSSize) {
        if let newSize = window?.contentLayoutRect.size {
            let newFontSize = newSize.height * sizeRatio
            font = NSFont(name: font?.fontName ?? "Helvetica", size: newFontSize)
        }
        super.resize(withOldSuperviewSize: oldSize)
    }

    
}
