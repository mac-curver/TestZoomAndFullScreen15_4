////
//  TestZoomAndFullScreen15_4
//  ResizingLayerView
//
//  Created by LegoEsprit on 09.03.25.
//  Copyright (c) 2025 LegoEsprit
//

import AppKit
import os.log



extension NSWindow.StyleMask {
    
    /// Returns all styleMasks which are set as String array
    var asStringArray: [String] {
        [
              ".borderless":             NSWindow.StyleMask.borderless
            , ".titled":                 NSWindow.StyleMask.titled
            , ".closable":               NSWindow.StyleMask.closable
            , ".miniaturizable":         NSWindow.StyleMask.miniaturizable
            , ".resizable":              NSWindow.StyleMask.resizable
            , ".utilityWindow":          NSWindow.StyleMask.utilityWindow
            , ".docModalWindow":         NSWindow.StyleMask.docModalWindow
            , ".nonactivatingPanel":     NSWindow.StyleMask.nonactivatingPanel
            , ".texturedBackground":     NSWindow.StyleMask(rawValue: 256)
            , ".unifiedTitleAndToolbar": NSWindow.StyleMask.unifiedTitleAndToolbar
            , ".hudWindow":              NSWindow.StyleMask.hudWindow
            , ".fullScreen":             NSWindow.StyleMask.fullScreen
            , ".fullSizeContentView":    NSWindow.StyleMask.fullSizeContentView
        ].filter( { contains($0.value)} ).map( {$0.key } ).sorted()
    }
    
    var debugString: String {
        "[\(asStringArray.joined(separator: ", "))]"
    }
    
}


/// Simple layer CATextLayer backed textual display
class ResizingLayerView: NSView {
    
    var sizeRatio = 0.8
    var text: CATextLayer = CATextLayer()
    
    var toFullScreen = false
    
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        wantsLayer = true
        addTextLayer()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        wantsLayer = true
        addTextLayer()
    }
        
    func willResize() {
        if let window = window {
            Logger.login("style: \(window.styleMask.debugString))")
            let destinationSize = toFullScreen ? window.frame.size : frame.size
            CATransaction.begin()
            CATransaction.setDisableActions(true)
            text.fontSize = destinationSize.height * sizeRatio
            text.frame = CGRect(origin: .zero, size: destinationSize)
            CATransaction.commit()
            Logger.logout("")
        }
    }
    


    func addTextLayer() {
        Logger.login("")
        text.string = "Xy"
        text.foregroundColor = NSColor.black.cgColor
        text.alignmentMode = .center
        text.fontSize = 280
        text.font = NSFont(name: "Helvetica", size: ignored)
        text.backgroundColor = NSColor.green.cgColor
        
        layer?.sublayers = nil
        layer = text
        Logger.logout("")
    }

    override func awakeFromNib() {
        Logger.login("")
        sizeRatio = text.fontSize / bounds.height
        willResize()
        Logger.logout("")
    }
    
 
    /// Resize fontsize according to frame
    /// - Parameter oldSize: Ignored
    override func resize(withOldSuperviewSize oldSize: NSSize) {
        Logger.login("\(String(describing: window?.frame.size))")
        super.resize(withOldSuperviewSize: oldSize)
        willResize()
        Logger.logout("")
    }
    
}



#Preview {
    let r = ResizingLayerView(frame: NSRect(x: 0, y: 0, width: 480, height: 360))
    r.addTextLayer()
    return r
}
