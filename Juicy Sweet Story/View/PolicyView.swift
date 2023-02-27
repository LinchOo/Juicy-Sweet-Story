//
//  PolicyView.swift
//  Juicy Sweet Story
//
//  Created by Олег Коваленко on 25.02.2023.
//

import SwiftUI

struct PolicyView: View {
    
    //Environment variable
    @Environment (\.presentationMode) var presentation
    
    //Animation variable
    @State var isShow: Bool = false
    
    //Helper variable
    @State var helper = HelperModel()
    
    // Policy Text
    private var policyText = "Copyright reserved by company etc"
    
    var body: some View {
        NavigationView{
            VStack{
                ScrollView{
                    if self.isShow{
                        Text(policyText)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .font(.custom("Knewave-Regular", size: 25))
                            .transition(.offset(y:500))
                        
                    }
                }
                .padding(.top, 50)
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
                            StrokeTextLabel(text: " PRIVACY POLICY ", size: 34)
                                .frame(width: 189, height: 53)
                            Text(" PRIVACY POLICY ")
                                .font(.custom("Knewave-Regular", size: 34))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                        }
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    withAnimation(.spring()) {
                        self.isShow = true
                    }
                }
                
            }
        }
        .navigationBarBackButtonHidden()
    }
}

struct PolicyView_Previews: PreviewProvider {
    static var previews: some View {
        PolicyView()
    }
}
