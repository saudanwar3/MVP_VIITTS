//
//  NewMeetingViewController.swift
//  VII_TTSA
//
//  Created by Muhammad Saud Anwar on 20/04/2021.
//

import Cocoa
import AgoraRtcKit

class NewMeetingViewController: NSViewController {

    
    @IBOutlet var mainView: NSView!
    @IBOutlet weak var joinBtn: AGEButton!
    @IBOutlet weak var roomInputTextField: AGETextField!
    @IBOutlet weak var roomInputLineView: NSView!
    
    private lazy var agoraKit: AgoraRtcEngineKit = {
        let engine = AgoraRtcEngineKit.sharedEngine(withAppId: KeyCenter.AppId, delegate: nil)
        engine.setLogFilter(AgoraLogFilter.info.rawValue)
        engine.setLogFile(FileCenter.logFilePath())
        return engine
    }()
    
    private var role = AgoraClientRole.audience {
        didSet {
            switch role {
            case .broadcaster:
                print("broadcaster")
//                broadcasterImageView.image = NSImage(named: "broadcaster-blue")
//                broadcasterBox.setTitle(" Host", with: NSColor.AGTextBlue)
//                broadcasterBox.state = .on
//
//                audienceBox.setTitle(" Audience", with: NSColor.AGTextGray)
//                audienceImageView.image = NSImage(named: "audience-gray")
//                audienceBox.state = .off
            case .audience:
                print("audience")
//                broadcasterImageView.image = NSImage(named: "broadcaster-gray")
//                broadcasterBox.setTitle(" Host", with: NSColor.AGTextGray)
//                broadcasterBox.state = .off
//
//                audienceImageView.image = NSImage(named: "audience-blue")
//                audienceBox.setTitle(" Audience", with: NSColor.AGTextBlue)
//                audienceBox.state = .on
            }
        }
    }
    
    private var settings = Settings()

    class func instantiateFromStoryboard() -> NewMeetingViewController
    {
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateController(withIdentifier: String(describing: self)) as! NewMeetingViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addColorToView(view: self.mainView, color: .white)
        
        roomInputTextField.layer?.backgroundColor = NSColor.white.cgColor
        roomInputTextField.textColor = NSColor.AGDarkGray
        roomInputTextField.setPlacehold("Enter meeting channel name", with: NSColor.AGTextGray)
        
        roomInputLineView.layer?.backgroundColor = NSColor.AGGray.cgColor
        
        joinBtn.layer?.cornerRadius = 22
        joinBtn.addTrackingArea(.default)
        joinBtn.image = NSImage(named: "icon-join")
        joinBtn.setTitle("Start", with: NSColor.white)


    }
    
    @IBAction func closeBtnClicked(_ sender: NSButton) {
        NSViewController().dismiss(self)
    }
    
    @IBAction func joinBtnClicked(_ sender: NSButton) {
        role = .broadcaster
        enter(roomName: roomInputTextField.stringValue)


    }
    func enter(roomName: String?) {
        guard let roomName = roomName, !roomName.isEmpty else {
            return
        }
        settings.role = role
        settings.roomName = roomName
        joinBtn.image = NSImage(named: "icon-join")
        roomInputTextField.stringValue = ""
        performSegue(withIdentifier: "mainVCToRoomVC", sender: nil)
    }

    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        guard let segueId = segue.identifier , !segueId.isEmpty else {
            return
        }
        
        switch segueId {
        case "mainVCToSettingsVC":
            let settingsVC = segue.destinationController as! SettingsViewController
            settingsVC.dataSource = self
            settingsVC.delegate = self
        print("")
        case "mainVCToRoomVC":
            let roomVC = segue.destinationController as! RoomViewController
            roomVC.dataSource = self
            roomVC.delegate = self
        default:
            break
        }
    }

}

extension NewMeetingViewController: SettingsVCDelegate {
    func settingsVC(_ vc: SettingsViewController, didUpdate settings: Settings) {
        self.settings = settings
    }
    
    func settingsVCNeedClose(_ vc: SettingsViewController) {
        vc.view.window?.contentViewController = self
    }
}

extension NewMeetingViewController: SettingsVCDataSource {
    func settingsVCNeedAgoraKit() -> AgoraRtcEngineKit {
        return agoraKit
    }
    
    func settingsVCNeedSettings() -> Settings {
        return settings
    }
}

extension NewMeetingViewController: RoomVCDelegate {
    func roomVCNeedClose(_ roomVC: RoomViewController) {
        guard let window = roomVC.view.window else {
            return
        }
        
        if window.styleMask.contains(.fullScreen) {
            window.toggleFullScreen(nil)
        }
        
        if window.styleMask.contains(.resizable) {
            window.styleMask.remove(.resizable)
        }
        
        //window.delegate = nil
        window.collectionBehavior = NSWindow.CollectionBehavior()

        window.contentViewController = self
        
        let size = CGSize(width: 700, height: 500)
        window.minSize = size
        window.setContentSize(size)
        window.maxSize = size
    }
}

extension NewMeetingViewController: RoomVCDataSource {
    func roomVCNeedSettings() -> Settings {
        return settings
    }
    
    func roomVCNeedAgoraKit() -> AgoraRtcEngineKit {
        return agoraKit
    }
}
