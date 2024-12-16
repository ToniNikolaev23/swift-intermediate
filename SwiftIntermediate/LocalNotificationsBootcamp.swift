//
//  LocalNotificationsBootcamp.swift
//  SwiftIntermediate
//
//  Created by Toni Stoyanov on 16.12.24.
//

import SwiftUI
import UserNotifications
import CoreLocation

class NotificationManager {
    static let instance = NotificationManager()
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error = error {
                print("Error: \(error)")
            } else {
                print("Success")
            }
        }
    }
    

    
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "This is my first notification"
        content.subtitle = "This was so easy!"
        content.sound = .default
        content.badge = 1
        
        //time
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        //Calendar
//        var dateComponents = DateComponents()
//        dateComponents.hour = 8
//        dateComponents.minute = 58
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        // location
        let coordinates = CLLocationCoordinate2D(latitude: 40.00, longitude: 50.00)
        
        let region = CLCircularRegion(
            center: coordinates,
            radius: 100,
            identifier: UUID().uuidString
        )
        region.notifyOnEntry = true
        region.notifyOnExit = false
        
        let trigger = UNLocationNotificationTrigger(region: region, repeats: true)
        

        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
    
    func cancelNotification() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
}

struct LocalNotificationsBootcamp: View {
    var body: some View {
        VStack(spacing: 40) {
            Button(action: {
                NotificationManager.instance.requestAuthorization()
            }, label: {
                Text("Request permission")
            })
            
            Button(action: {
                NotificationManager.instance.scheduleNotification()
            }, label: {
                Text("Schedule Notification")
            })
            
            Button(action: {
                NotificationManager.instance.cancelNotification()
            }, label: {
                Text("Cancel Notification")
            })
        }
        .onAppear {
//            UIApplication.shared.applicationIconBadgeNumber = 0
            UNUserNotificationCenter.current().setBadgeCount(0)


        }
    }
}

#Preview {
    LocalNotificationsBootcamp()
}
