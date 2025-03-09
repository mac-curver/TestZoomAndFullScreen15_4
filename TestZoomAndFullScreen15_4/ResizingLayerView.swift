////
//  TestZoomAndFullScreen15_4
//  ResizingLayerView
//
//  Created by LegoEsprit on 09.03.25.
//  Copyright (c) 2025 LegoEsprit
//

import AppKit
import os.log

class ResizingLayerView: NSView {
    
    var text: CATextLayer = CATextLayer()
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        wantsLayer = true
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        wantsLayer = true
    }
    
    func willResize(suppressImplicitAnimation: Bool = true) {
        if suppressImplicitAnimation {
            CATransaction.begin()
            CATransaction.setDisableActions(true)
        }
        text.fontSize = bounds.height * 200/360
        text.frame = bounds
        if suppressImplicitAnimation {
            CATransaction.commit()
        }
    }

    func addTextLayer() {
        text.string = "Xy"
        text.foregroundColor = NSColor.black.cgColor
        text.alignmentMode = .center
        text.fontSize = 200
        text.font = NSFont(name: "Helvetica", size: text.fontSize)
        text.frame = self.bounds

        layer?.addSublayer(text)
        layer?.backgroundColor = NSColor.green.cgColor
    }

    override func awakeFromNib() {
        addTextLayer()
    }
    
}

#Preview {
    let r = ResizingLayerView(frame: NSRect(x: 0, y: 0, width: 480, height: 360))
    r.addTextLayer()
    return r
}
