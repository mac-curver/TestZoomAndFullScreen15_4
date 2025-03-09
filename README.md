# Issue layer backed window in full screen mode
This app for **MacOS** developped with XCode 15.4 (Project is compatible to XCode 16.2) shows 2 basically identical windows. 
The one with the yellow background displays a text as NSLabel (NSTextField) and allows live resize and to enter and leave full screen mode accurately. The second with green background uses a custom NSView to emulate the label display using CATextLayer. Again the live resize works properly, but entering the full screen the text is displayed too small (Pic1) and when exiting the full screen mode the text is displayed much too large. Only after using live resize the text size witll be set correctly again. 

![wrongFullScreen](https://github.com/user-attachments/assets/36ff00a6-7827-4dbf-9e43-c6f1e3c7e944)
*Pic1: Wrong text scaling after entering full screen*

![expectedFullScreen](https://github.com/user-attachments/assets/e61abc4a-5404-4c8b-9a32-89c8ee4053b7)
*Pic2: Expected scaling in full screen*

The expected scaling here is forced by adding 
    func windowDidEnterFullScreen(_ notification: Notification) {
        resizingLayerView.willResize(suppressImplicitAnimation: false)
    }
as NSWindowDelegate method. But then the zoom animation is very ugly.

