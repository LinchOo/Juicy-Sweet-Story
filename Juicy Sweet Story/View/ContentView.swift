//
//  ContentView.swift
//  Juicy Sweet Story
//
//  Created by Олег Коваленко on 25.02.2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    //Environment variables
    @Environment(\.managedObjectContext) private var viewContext
    
    // Work with Core Data
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    //Animation variables
    @State var isActive: Bool = false
    @State var isShow: Bool = false
    
    //Helper variable
    @State var helper = HelperModel()
   
    
    
    var body: some View {
        NavigationView{
            if self.isActive{
                VStack(spacing: 16){
                    Image("candys")
                        .resizable()
                        .frame(width: 350, height: 233)
                        .ignoresSafeArea()
                        .padding(.top,15)
                    
                    Spacer()
                        .frame(height: 20)
                    
//   Play Button -> Select Level  //
                    
                    if isShow{
                        withAnimation(.spring().speed(0.8)) {
                            
                            NavigationLink(destination: SelectLevelView()) {
                                Text(" PLAY ")
                                    .foregroundColor(.white)
                                    .font(.custom("Knewave-Regular", size: 34))
                                    .frame(width: 350,height: 70)
                                    .background(
                                        RoundedRectangle(cornerRadius: 25)
                                            .fill(helper.gradient)
                                    )
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 25)
                                            .stroke(.white, lineWidth: 5)
                                    }

                            }
                            .transition(.offset(x:600))
                        }
                    }
                    
//   Game Rules Button -> Game Rules View //
                    
                    if isShow{
                        withAnimation(.spring().speed(1.0)) {
                            NavigationLink(destination: RulesView()) {
                                Text(" GAME RULES ")
                                    .foregroundColor(.white)
                                    .font(.custom("Knewave-Regular", size: 34))
                                    .frame(width: 300)
                                    .frame(width: 350,height: 70)
                                    .background(
                                        RoundedRectangle(cornerRadius: 25)
                                            .fill(helper.gradient)
                                    )
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 25)
                                            .stroke(.white, lineWidth: 5)
                                    }
                                
                            }
                            .transition(.offset(x:800))
                        }
                        
                    }
                    
//   Settings Button  -> Settings Menu  //
                    
                    if isShow{
                        withAnimation(.spring().speed(1.2)) {
                            NavigationLink(destination: SettingsView()) {
                                Text(" SETTINGS ")
                                    .foregroundColor(.white)
                                    .font(.custom("Knewave-Regular", size: 34))
                                    .frame(width: 300)
                                    .frame(width: 350,height: 70)
                                    .background(
                                        RoundedRectangle(cornerRadius: 25)
                                            .fill(helper.gradient)
                                    )
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 25)
                                            .stroke(.white, lineWidth: 5)
                                    }
                            }
                            .transition(.offset(x:1000))
                        }
                        
                    }
                    
//   Policy Button  -> Pivacy Policy View  //

                    if isShow{
                        withAnimation(.spring().speed(1.4)) {
                            NavigationLink(destination: PolicyView()) {
                                
                                Text(" PRIVACY POLICY ")
                                    .foregroundColor(.white)
                                    .font(.custom("Knewave-Regular", size: 34))
                                    .frame(width: 300)
                                    .frame(width: 350,height: 70)
                                    .background(
                                        RoundedRectangle(cornerRadius: 25)
                                            .fill(helper.gradient)
                                    )
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 25)
                                            .stroke(.white, lineWidth: 5)
                                    }
                                
                            }
                            .transition(.offset(x:1200))
                        }
                    }
                    Spacer()
                    
                }
                
                .background(
                    Image("backgroundImage")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .ignoresSafeArea()
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                )
            }
            else {
                LoadingScreenView()
            }
        }
        
// OnAppear Loading Screen -> Start Animation
        
        .onAppear {
            // Fetch from DB Score Results
            // Fetch from BD Settings
            // Start music
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                withAnimation(.spring()) {
                    self.isActive = true
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.1) {
                withAnimation(.spring()) {
                    self.isShow = true
                }
                
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
