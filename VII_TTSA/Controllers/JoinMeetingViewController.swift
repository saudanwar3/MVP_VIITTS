//
//  JoinMeetingViewController.swift
//  VII_TTSA
//
//  Created by Muhammad Saud Anwar on 19/04/2021.
//

import Cocoa
import AgoraRtcKit

class JoinMeetingViewController: NSViewController {

    @IBOutlet var mainView: NSView!
    @IBOutlet weak var roomInputTxtfield: NSTextField!
    @IBOutlet weak var joinBtn: NSButton!
    
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
            case .audience:
                print("audience")
            }
        }
    }
    
    private var settings = Settings()

    class func instantiateFromStoryboard() -> JoinMeetingViewController
    {
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateController(withIdentifier: String(describing: self)) as! JoinMeetingViewController
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addColorToView(view: self.mainView, color: .white)
        
        roomInputTxtfield.layer?.backgroundColor = NSColor.white.cgColor
        roomInputTxtfield.textColor = NSColor.AGDarkGray
        roomInputTxtfield.setPlacehold("Enter meeting channel name", with: NSColor.AGTextGray)


    }
    
    @IBAction func closeBtnClicked(_ sender: NSButton) {
        NSViewController().dismiss(self)

    }
    
    @IBAction func joinBtnClicked(_ sender: NSButton) {
        role = .audience
        enter(roomName: roomInputTxtfield.stringValue)

    }
    
    func enter(roomName: String?) {
        guard let roomName = roomName, !roomName.isEmpty else {
            return
        }
        settings.role = role
        settings.roomName = roomName
//        joinBtn.image = NSImage(named: "icon-join")
        roomInputTxtfield.stringValue = ""
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
extension JoinMeetingViewController: SettingsVCDelegate {
    func settingsVC(_ vc: SettingsViewController, didUpdate settings: Settings) {
        self.settings = settings
    }
    
    func settingsVCNeedClose(_ vc: SettingsViewController) {
        vc.view.window?.contentViewController = self
    }
}

extension JoinMeetingViewController: SettingsVCDataSource {
    func settingsVCNeedAgoraKit() -> AgoraRtcEngineKit {
        return agoraKit
    }
    
    func settingsVCNeedSettings() -> Settings {
        return settings
    }
}

extension JoinMeetingViewController: RoomVCDelegate {
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

extension JoinMeetingViewController: RoomVCDataSource {
    func roomVCNeedSettings() -> Settings {
        return settings
    }
    
    func roomVCNeedAgoraKit() -> AgoraRtcEngineKit {
        return agoraKit
    }
}
