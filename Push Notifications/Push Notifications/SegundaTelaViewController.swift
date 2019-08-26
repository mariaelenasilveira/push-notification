//
//  SegundaTelaViewController.swift
//  Push Notifications
//
//  Created by Mariaelena Nascimento Silveira on 23/08/19.
//  Copyright © 2019 Mariaelena Nascimento Silveira. All rights reserved.
//

import UIKit
import UserNotifications

class SegundaTelaViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func notificar2(_ sender: Any) {
        
        let content = UNMutableNotificationContent()
        content.title = "melhor ainda"
        content.body = "Deu bem demais"
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 4, repeats: false)
        let request = UNNotificationRequest(identifier: "testIdentifier", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }

}
