//
//  LevelCompletedView.swift
//  Juicy Sweet Story
//
//  Created by Олег Коваленко on 26.02.2023.
//

import SwiftUI

struct LevelCompletedView: View {
    
    // Helper variable
    @State var helper = HelperModel()
    
    
    var body: some View {
        VStack{
            Spacer()
                .frame(height: 100)
            VStack{
                ZStack{
                    Image("characterIdle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 385,height: 385)
                        .offset(y:-150)
                    Image("levelcompleted")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 330 , height: 200)
                }
            }
            
           
            .frame(height: 200)
            VStack{
                ZStack{
                    StrokeTextLabel(text: " CURRENT TIME: 00:43 ", size: 32)
                    Text(" CURRENT TIME: 00:43 ")
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .font(.custom("Knewave-Regular", size: 32))
                }
                .frame(width: 350, height: 60)
                .background(
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.white)
                )
                .overlay {
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(helper.gradient, lineWidth: 5)
                }
                ZStack{
                    StrokeTextLabel(text: " BEST TIME: 00:43 ", size: 32)
                    Text(" BEST TIME: 00:43 ")
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .font(.custom("Knewave-Regular", size: 32))
                }
                .frame(width: 350, height: 60)
                .background(
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.white)
                )
                .overlay {
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(helper.gradient, lineWidth: 5)
                }
            }
            HStack{
                Button{
                    
                    // Navigation backward button
                    
                   
                } label: {
                    Image("home")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .padding(5)
                        .background(
                            Circle().fill(.white)
                        )
                        .overlay {
                            Circle().stroke(helper.gradient, lineWidth: 5)
                        }
                }
                .frame(width: 60 ,height: 40)
                Button{
                    
                    // Reload lvl
                    
                    
                } label: {
                    Image("reload")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 70, height: 70)
                        .padding(10)
                        .background(
                            Circle().fill(.white)
                        )
                        .overlay {
                            Circle().stroke(helper.gradient, lineWidth: 5)
                        }
                        .offset(y:15)
                }
                .frame(width: 100  ,height: 100)
                Button{
                    
                    // Navigation forward button
                    
                } label: {
                    Image("arrow2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .padding(5)
                        .background(
                            Circle().fill(.white)
                        )
                        .overlay {
                            Circle().stroke(helper.gradient, lineWidth: 5)
                        }

                }
                .frame(width: 60 ,height: 40)
                
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
            .background(
                Rectangle().fill(helper.shadowGradient)
                    .ignoresSafeArea()
                )
            
    }
}

struct LevelCompletedView_Previews: PreviewProvider {
    static var previews: some View {
        LevelCompletedView()
    }
}
