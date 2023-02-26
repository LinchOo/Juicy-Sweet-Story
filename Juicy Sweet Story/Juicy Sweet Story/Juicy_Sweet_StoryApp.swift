//
//  Juicy_Sweet_StoryApp.swift
//  Juicy Sweet Story
//
//  Created by Олег Коваленко on 25.02.2023.
//

import SwiftUI

@main
struct Juicy_Sweet_StoryApp: App {
    let persistenceController = PersistenceController.shared
    @State var isActive: Bool = false
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
