//
//  HelperModel.swift
//  Juicy Sweet Story
//
//  Created by Олег Коваленко on 26.02.2023.
//


import SwiftUI

// Time Formater Function

func TimerFormater(seconds:Int) -> String {
    let minutes = "\((seconds % 3600) / 60)"
    let seconds = "\((seconds % 3600) % 60)"
    let minuteStamp = minutes.count > 1 ? minutes : "0" + minutes
    let secondStamp = seconds.count > 1 ? seconds : "0" + seconds
    
    return "\(minuteStamp) : \(secondStamp)"
}

// Helper model

struct HelperModel {
    
    // Gradient Variable
    let gradient = LinearGradient(gradient: Gradient(colors: [Color("gradientColor1"), Color("gradientColor2"),Color("gradientColor3")]), startPoint: .top, endPoint: .bottom)
    let shadowGradient = LinearGradient(gradient: Gradient(colors: [Color(.black).opacity(0.4), Color(.black).opacity(0.9)]), startPoint: .top, endPoint: .bottom)
}
