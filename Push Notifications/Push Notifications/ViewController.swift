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

    var contadorNotificacao = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Notificacao agendada para um dia específico
        let content = UNMutableNotificationContent()
        content.title = "Notificacao agendada"
        content.body = "acho que rolou"
        content.sound = UNNotificationSound.default

        let dateComponents = DateComponents(calendar: Calendar.current, year: 2019, month: 8, day: 26, hour: 15, minute: 11)

        print(dateComponents)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        let request = UNNotificationRequest(identifier: "agendada", content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    @IBAction func notificar(_ sender: Any) {
        contadorNotificacao += 1
        
        let content = UNMutableNotificationContent()
        content.title = "Prextooooou 💃🏻"
        content.body = "Parabens Neninha, muito bem em 👏🏽"
        content.sound = UNNotificationSound.default
        let time = contadorNotificacao + 2
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(time), repeats: false) // notificacao enviada após 5 segundos que o botao foi acionado
        let request = UNNotificationRequest(identifier: "testIdentifier" + contadorNotificacao.description, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
    }
    
    @IBAction func listarNotificacao(_ sender: Any) {
        UNUserNotificationCenter.current().getPendingNotificationRequests(completionHandler: { requests -> () in
            print("\(requests.count) requests -----")
            for request in requests {
                print(request.identifier)
            }
        })
        UNUserNotificationCenter.current().getDeliveredNotifications(completionHandler: {deliveredNotifications -> () in
            print("\(deliveredNotifications.count) Delivered notifications-----")
            for notification in deliveredNotifications{
                print(notification.request.identifier)
            }
        })
    }
    
    @IBAction func cancelarNotificacao(_ sender: Any) {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["testIdentifier7"])
    }
    
}

