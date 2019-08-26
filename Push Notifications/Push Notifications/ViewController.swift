//
//  ViewController.swift
//  Push Notifications
//
//  Created by Mariaelena Nascimento Silveira on 22/08/19.
//  Copyright © 2019 Mariaelena Nascimento Silveira. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Notificacao agendada para um dia específico
        let content = UNMutableNotificationContent()
        content.title = "Notificacao agendada"
        content.body = "acho que rolou"
        content.sound = UNNotificationSound.default
        
        let dateComponents = DateComponents(calendar: Calendar.current, year: 2019, month: 8, day: 26, hour: 10, minute: 52)
        
        print(dateComponents)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        let request = UNNotificationRequest(identifier: "testIdentifier", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    @IBAction func notificar(_ sender: Any) {
        
        let content = UNMutableNotificationContent()
        content.title = "Prextooooou 💃🏻"
        content.body = "Parabens Neninha, muito bem em 👏🏽"
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false) // notificacao enviada após 5 segundos que o botao foi acionado
        
        let request = UNNotificationRequest(identifier: "testIdentifier", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
    }
    

}

