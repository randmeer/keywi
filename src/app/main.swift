import AppKit

let app = NSApplication.shared

@objc protocol EditMenuActions {
	func redo(_ sender:AnyObject)
	func undo(_ sender:AnyObject)
}

class WindowDelegate: NSObject, NSWindowDelegate {

    // terminate the application when the window is closed
    func windowWillClose(_ notification: Notification) {
        NSApplication.shared.terminate(0)
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    let window = NSWindow()
    let windowDelegate = WindowDelegate()

	let appName = "Keywi"

	func populateMainMenu() {
		let mainMenu = NSMenu(title:"MainMenu")
		
		// Application Menu
		var submenu = NSMenu(title:"Application")
		submenu.addItem(withTitle:"About " + appName, action:#selector(NSApplication.orderFrontStandardAboutPanel(_:)), keyEquivalent:"")
		submenu.addItem(NSMenuItem.separator())
		submenu.addItem(withTitle:"Hide " + appName, action:#selector(NSApplication.hide(_:)), keyEquivalent:"h")
		let hideMenu = submenu.addItem(withTitle:"Hide Others", action:#selector(NSApplication.hideOtherApplications(_:)), keyEquivalent:"h")
		hideMenu.keyEquivalentModifierMask = [.command, .option]
		submenu.addItem(withTitle:"Show All", action:#selector(NSApplication.unhideAllApplications(_:)), keyEquivalent:"")
		submenu.addItem(NSMenuItem.separator())
		submenu.addItem(withTitle:"Quit " + appName, action:#selector(NSApplication.terminate(_:)), keyEquivalent:"q")
		mainMenu.setSubmenu(submenu, for: mainMenu.addItem(withTitle:"Application", action:nil, keyEquivalent:""))

		// File Menu
		submenu = NSMenu(title: "File")
		submenu.addItem(withTitle:"New Configuration", action:nil, keyEquivalent:"n")
		submenu.addItem(withTitle:"Export Configurations", action:nil, keyEquivalent:"e")
		submenu.addItem(withTitle:"Import Configuration(s)", action:nil, keyEquivalent:"i")
		submenu.addItem(NSMenuItem.separator())
		submenu.addItem(withTitle:"Close Window", action:#selector(NSWindow.performClose(_:)), keyEquivalent:"w")
		mainMenu.setSubmenu(submenu, for: mainMenu.addItem(withTitle:"File", action:nil, keyEquivalent:"g"))

		NSApp.mainMenu = mainMenu
	}

    func applicationDidFinishLaunching(_ notification: Notification) {
        window.delegate = windowDelegate
        window.styleMask = [.closable, .miniaturizable, .resizable, .titled]
		window.setFrame(NSRect(x: 0, y: 0, width: 300, height: 300), display: false)

		window.center()

        populateMainMenu()

		window.title = "this should not be here"
        window.makeKeyAndOrderFront(nil)
        if (window.isMainWindow) {
            window.title = "Keywi Main Window"
        }

    }
}

let delegate = AppDelegate()
app.delegate = delegate
app.run()