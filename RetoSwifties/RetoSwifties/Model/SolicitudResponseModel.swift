//
//  ConfirmacionTurnoView.swift
//  RetoSwifties
//
//  Created by Alumno on 27/08/25.
//

import Foundation

struct TurnResponse: Codable{
    let NextTurn: Int
    let ServiceID: Int
    let TurnNumber: Int
}

struct HourTotal: Codable {
    let HourNumber: Int
    let Total: Int
}
