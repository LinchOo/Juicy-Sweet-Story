//
//  SettingsView.swift
//  Juicy Sweet Story
//
//  Created by Олег Коваленко on 25.02.2023.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    
    //Environment variables
    @Environment(\.requestReview) var requestReview
    @Environment (\.presentationMode) var presentation
    
    //Helper variable
    @State var helper = HelperModel()
    
    //Animation variables
    @State var isShow: Bool = false
    @State var isShow2: Bool = false
    @State var isShow3: Bool = false
    
    //Settings variables
    @State var sound = true
    @State var vibro = false
    
    
    
    
    var body: some View {
        NavigationView{
            VStack(spacing: 20){
                HStack(spacing: 16){
                    if isShow{
                        Text(" SOUND ")
                            .foregroundColor(.white)
                            .font(.custom("Knewave-Regular", size: 34))
                            .frame(width: 270,height: 70)
                            .background(
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(helper.gradient)
                            )
                            .overlay {
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(.white, lineWidth: 5)
                            }
                            .transition(.scale(scale: -10.0))
                        
                        
//   Sound Button -> On / oFF Sound  //
                        Button{
                            // Setup sound on/off
                            sound.toggle()
                        }label: {
                            Image(systemName: sound ? "checkmark" : "xmark")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                        }
                        .frame(width: 60,height: 60)
                        .background(
                            RoundedRectangle(cornerRadius: 25)
                                .fill(helper.gradient)
                        )
                        .overlay {
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(.white, lineWidth: 5)
                        }
                        .transition(.scale(scale: -0.3))
                        
                    }
                }
                HStack(spacing: 16){
                    if isShow2{
                        Text(" VIBRO ")
                            .foregroundColor(.white)
                            .font(.custom("Knewave-Regular", size: 34))
                            .frame(width: 270,height: 70)
                            .background(
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(helper.gradient)
                            )
                            .overlay {
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(.white, lineWidth: 5)
                            }
                        
//   Sound Button -> On / oFF Sound  //
                        
                        Button{
                            // Setup vibro on/off
                            vibro.toggle()
                        }label: {
                            Image(systemName: vibro ? "checkmark" : "xmark")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                        }
                        .frame(width: 60,height: 60)
                        .background(
                            RoundedRectangle(cornerRadius: 25)
                                .fill(helper.gradient)
                        )
                        .overlay {
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(.white, lineWidth: 5)
                        }
                    }
                }
                
//   Rate Button -> Rate Menu View  //
                
                if isShow3{
                    Button{
                        requestReview()
                    }label: {
                        Text(" RATE US ")
                            .foregroundColor(.white)
                            .font(.custom("Knewave-Regular", size: 34))
                    }
                    
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
                Spacer()
                
            }
            .padding(.top,60)
            .background(
                ZStack{
                    Image("backgroundImage")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                }
                    .ignoresSafeArea()
            )
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack{
                        Button{
                            
                            // Navigation forward button
                            
                            self.presentation.wrappedValue.dismiss ()
                        } label: {
                            Image("arrow")
                                .resizable()
                                .frame(width: 22, height: 37)
                                .padding()
                                .background(
                                    Circle().fill(.white)
                                )
                                .overlay {
                                    Circle().stroke(helper.gradient, lineWidth: 5)
                                }
                        }
                        ZStack{
                            StrokeTextLabel(text: " SETTINGS ", size: 34)
                                .frame(width: 189, height: 53)
                            Text(" SETTINGS ")
                                .font(.custom("Knewave-Regular", size: 34))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                        }
                    }
                }
            }
            
        }
        .navigationBarBackButtonHidden() // hide default Navigation Button
        
// On Appear Starting Animation
        .onAppear {
            
            // Fetch from DB Settings -> set up Check Buttons
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation(.spring()){
                    self.isShow = true
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                withAnimation(.spring()){
                    self.isShow2 = true
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.1) {
                withAnimation(.spring()){
                    self.isShow3 = true
                }
            }
            
        }
    }
    
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
