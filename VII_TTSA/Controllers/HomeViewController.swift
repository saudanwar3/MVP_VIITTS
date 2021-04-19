//
//  HomeViewController.swift
//  VII_TTSA
//
//  Created by Muhammad Saud Anwar on 18/04/2021.
//

import Cocoa

class HomeViewController: NSViewController {

    @IBOutlet var mainView: NSView!
    @IBOutlet weak var weatherImgView: NSImageView!
    @IBOutlet weak var documentsImgView: NSImageView!
    @IBOutlet weak var tlsImgView: NSImageView!
    
    class func instantiateFromStoryboard() -> HomeViewController
    {
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateController(withIdentifier: String(describing: self)) as! HomeViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        self.addColorToView(view: self.mainView, color: .white)
        self.weatherImgView.wantsLayer = true
        self.weatherImgView.layer?.cornerRadius = 18.0
        
        self.documentsImgView.wantsLayer = true
        self.documentsImgView.layer?.cornerRadius = 18.0

        self.tlsImgView.wantsLayer = true
        self.tlsImgView.layer?.cornerRadius = 18.0


    }
    
}
