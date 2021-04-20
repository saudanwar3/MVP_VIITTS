//
//  ContactsViewController.swift
//  VII_TTSA
//
//  Created by Muhammad Saud Anwar on 20/04/2021.
//

import Cocoa

class ContactsViewController: NSViewController {

    @IBOutlet var mainView: NSView!
    
    class func instantiateFromStoryboard() -> ContactsViewController
    {
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateController(withIdentifier: String(describing: self)) as! ContactsViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}
