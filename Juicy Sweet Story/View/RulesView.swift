//
//  RulesView.swift
//  Juicy Sweet Story
//
//  Created by Олег Коваленко on 25.02.2023.
//

import SwiftUI

struct RulesView: View {
    //Environment variable
    @Environment (\.presentationMode) var presentation
    
    // Animation variable
    @State var isShow: Bool = false
    
    // Text variables
    let tittle = " Welcome to Juicy \nSweet Story! "
    let text = "Explore every of 12 levels, move puzzles to create the same picture as in example.\nEach level have time limitation on pass it, and it's time will decrease in each level.\nIf you loose - you can try to pass level again.\nIf you win - you can pass the next level."
    
    // Helper variable
    @State var helper = HelperModel()
    
    

    var body: some View {
        NavigationView{
            VStack{
                ZStack{

                    StrokeTextLabel(text: tittle, size: 35)
                        .padding()
                        .frame(width: 290)
                    Text(tittle)
                        .font(.custom("Knewave-Regular", size: 35))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                }
                .frame(width: 290, height: 114)
                if self.isShow{
                    Text(text)
                        .font(.custom("Knewave-Regular", size: 24))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 40)
                        .transition(.offset(x:1000))
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    withAnimation(.spring()) {
                        self.isShow = true
                    }
                }
            }

            .background(
                ZStack{
                    Image("backgroundImage")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    Color("gradientColor1").opacity(0.8)
                }
                    .ignoresSafeArea()
            )
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack{
                        Button{
                                self.presentation.wrappedValue.dismiss ()
                            self.isShow = false
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
                            StrokeTextLabel(text: " GAME RULES ", size: 34)
                                .frame(width: 189, height: 53)
                            Text(" GAME RULES ")
                                .font(.custom("Knewave-Regular", size: 34))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

struct RulesView_Previews: PreviewProvider {
    static var previews: some View {
        RulesView()
    }
}
