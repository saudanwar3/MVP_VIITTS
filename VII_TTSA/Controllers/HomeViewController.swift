//
//  HomeViewController.swift
//  VII_TTSA
//
//  Created by Muhammad Saud Anwar on 18/04/2021.
//

import Cocoa

class HomeViewController: NSViewController {

    @IBOutlet var mainView: NSView!
    
    class func instantiateFromStoryboard() -> HomeViewController
    {
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateController(withIdentifier: String(describing: self)) as! HomeViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        self.addColorToView(view: self.mainView, color: .white)

    }
    
}
