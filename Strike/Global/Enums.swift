//
//  Enums.swift
//  iRideDriver
//
//  Created by Buzzware Tech on 10/12/2021.
//

import UIKit

class Enums {
    
}
enum statuses:String{
    case booked,driverAccepted,driverReached,rideStarted,rideCompleted,rated,cancelled,reBooked,dispute,disputed
}
enum ListType{
    case history,running,upcoming
}
enum UserRole:String{
    case admin,user,driver
}
enum NotifiType:String{
    case promotion,reminder,chat,adminChat
}
