//
//  JoinMeetingViewController.swift
//  VII_TTSA
//
//  Created by Muhammad Saud Anwar on 19/04/2021.
//

import Cocoa

class JoinMeetingViewController: NSViewController {

    @IBOutlet var mainView: NSView!
    
    class func instantiateFromStoryboard() -> JoinMeetingViewController
    {
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateController(withIdentifier: String(describing: self)) as! JoinMeetingViewController
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addColorToView(view: self.mainView, color: .white)

    }
    
    @IBAction func closeBtnClicked(_ sender: NSButton) {
        NSViewController().dismiss(self)

    }
}
