//
//  MeetingViewController.swift
//  VII_TTSA
//
//  Created by Muhammad Saud Anwar on 19/04/2021.
//

import Cocoa

class MeetingViewController: NSViewController {

    @IBOutlet var mainView: NSView!
    class func instantiateFromStoryboard() -> MeetingViewController
    {
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateController(withIdentifier: String(describing: self)) as! MeetingViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        self.addColorToView(view: self.mainView, color: .white)

    }
    
}
