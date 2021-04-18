//
//  ViewController.swift
//  VII_TTSA
//
//  Created by Muhammad Saud Anwar on 18/04/2021.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet var mainView: NSView!
    @IBOutlet weak var separatorHorizontalView: NSView!
    @IBOutlet weak var separatorHorizontalView3: NSView!
    @IBOutlet weak var separatorHorizontalView2: NSView!
    
    @IBOutlet weak var emailView: NSView!
    @IBOutlet weak var emailTxtField: NSTextField!
    
    @IBOutlet weak var passwordView: NSView!
    @IBOutlet weak var passwordTxtField: NSTextField!
    
    @IBOutlet weak var signinBox: NSBox!
    @IBOutlet weak var signinBtn: NSButton!
    
    @IBOutlet weak var keepMeSignedinBtn: NSButton!
    
    @IBOutlet weak var signupBox: NSBox!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.window?.setFrame(NSRect(x:0,y:0,width: 1440,height: 790), display: true)

        self.addColorToView(view: self.mainView, color: .white)
        self.addColorToView(view: self.separatorHorizontalView, color: .black)
        self.addColorToView(view: self.separatorHorizontalView3, color: .black)
        self.addColorToView(view: self.separatorHorizontalView2, color: .black)
        
        self.addColorToView(view: self.emailView, color: NSColor(hex: "#2A2A36")!)
        self.emailView.layer?.borderColor = .black
        self.emailView.layer?.cornerRadius = 5.0
        self.emailView.layer?.borderWidth = 1.0
        
        self.addColorToView(view: self.passwordView, color: NSColor(hex: "#2A2A36")!)
        self.passwordView.layer?.borderColor = .black
        self.passwordView.layer?.cornerRadius = 5.0
        self.passwordView.layer?.borderWidth = 1.0


        self.signinBox.cornerRadius = 18
        
        self.signupBox.wantsLayer = true
        self.signupBox.cornerRadius = 18
        self.signupBox.borderColor = NSColor(hex: "#2A2A36")!
        self.signupBox.borderWidth = 2.0
        self.signupBox.layer?.backgroundColor = NSColor(hex: "#2A2A36")!.cgColor
        self.signupBox.layer?.cornerRadius = 18.0
        self.signupBox.layer?.borderWidth = 2.0
        self.signupBox.layer?.borderColor = NSColor(hex: "#2A2A36")!.cgColor
        self.signupBox.layer?.masksToBounds = true
        
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func keepmeSignedInBtnClicked(_ sender: NSButton) {
        print("clicked")
    }
    
}
extension ViewController
{
    func addColorToView(view:NSView , color:NSColor) -> Void {
        view.wantsLayer = true
//        view.layer?.backgroundColor = color.cgColor
        view.setValue(color, forKey: "backgroundColor")

    }
}
