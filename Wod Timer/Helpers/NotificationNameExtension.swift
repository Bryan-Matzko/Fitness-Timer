//
//  NotificationNameExtension.swift
//  Wod Timer
//
//  Created by Bryan Matzko on 2018-11-08.
//  Copyright © 2018 Bryan Matzko. All rights reserved.
//

import Foundation

extension  Notification.Name
{
    static let saveTimerType = Notification.Name("saveTimerType")
    static let saveDurationPicker = Notification.Name("saveDurationPicker")
    static let saveRoundsPicker = Notification.Name("saveRoundsPicker")
    static let saveTotalDurationPicker = Notification.Name("saveTotalDurationPicker")
}
