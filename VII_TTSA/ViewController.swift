//
//  ViewController.swift
//  VII_TTSA
//
//  Created by Muhammad Saud Anwar on 18/04/2021.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet var mainView: NSView!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.mainView.wantsLayer = true
        self.mainView.layer?.backgroundColor = .white
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

