//
//  SelectLevelView.swift
//  Juicy Sweet Story
//
//  Created by Олег Коваленко on 26.02.2023.
//

import SwiftUI

struct LvLModel{
    // Fetch Levels from DB
    var lvlArray = ["level1","level2","level3","level4","level5","level6","level7","level8","level9","level10","level11","level12"]
    
    // Fetch Score from DB
    var scoreArray = ["1:00","2:10","2:10"]
}

struct SelectLevelView: View {
    
    // Environment variable
    @Environment (\.presentationMode) var presentation
    
    // Helper variables
    @State var helper = HelperModel()
    @State var lvl = LvLModel()
    
    // Animation variable
    @State var isShow: Bool = false
    
    
    
    // Colums setup
    let colums: [GridItem] = [
        .init(.fixed(103), spacing: 13, alignment: nil),
        .init(.fixed(103), spacing: 13, alignment: nil),
        .init(.fixed(103), spacing: 13, alignment: nil)
    ]
    
    // Interactive variable
    @State var lvlSelected = ""
    @State var isSelected = false
    
    
    
    var body: some View {
        NavigationView{
            VStack{
// Level Grid Section
                    LazyVGrid(columns: colums,alignment: .center,spacing: 13) {
                        ForEach(0..<lvl.lvlArray.count){ index in
                            Image(lvl.lvlArray[index])
                                .resizable()
                                .frame(width: 103, height: 103)
                                .aspectRatio(contentMode: .fill)
                                .overlay {
                                    ZStack{
                                        if !lvl.scoreArray.indices.contains(index) {
                                            ZStack{
                                                RoundedRectangle(cornerRadius: 23)
                                                    .fill(.black.opacity(0.7))
                                                Image("lollipop")
                                                    .resizable()
                                                    .frame(width: 75, height: 75)
                                            }
                                        }
                                        Image("frame")
                                            .resizable()
                                        
                                        Circle()
                                            .stroke(helper.gradient, lineWidth: 5)
                                            .frame(width: 25,height: 25)
                                            .background(
                                                Circle().fill(.white)
                                            )
                                            .offset(x:35,y:35)
                                        
                                        ZStack{
                                            StrokeTextLabel(text: "\(index+1)", size: 12)
                                            Text("\(index+1)")
                                                .font(.custom("Knewave-Regular", size: 12))
                                                .foregroundColor(.white)
                                            
                                        }.offset(x:35,y:35)
                                    }
                                    
                                }
                                .onTapGesture {
                                    
// LvL selection Gesture and setup
                                    
                                    if !lvl.scoreArray.indices.contains(index) {
                                        withAnimation(.spring()) {
                                            isSelected = false
                                        }
                                    } else {
                                        withAnimation(.spring()) {
                                            isSelected = true
                                        }
                                        
                                    }
                                    lvlSelected = lvl.lvlArray[index]
                                }
                        }
                    }.padding(.top,100)
                Spacer()
                
// Play Button -> PlayViewModel
                
                if isSelected{
                    NavigationLink(destination: PlayViewModel(lvlSelected: $lvlSelected)) {
                        Text(" PLAY ")
                            .foregroundColor(.white)
                            .font(.custom("Knewave-Regular", size: 34))
                    }
                    .frame(width: 150,height: 60)
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .fill(helper.gradient)
                    )
                    .overlay {
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(.white, lineWidth: 5)
                    }
                    .transition(.offset(y:500))
                    
                }
                
// Bakground and ToolBar section
            }
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
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                                .padding(5)
                                .background(
                                    Circle().fill(.white)
                                )
                                .overlay {
                                    Circle().stroke(helper.gradient, lineWidth: 5)
                                }
                        }
                        .frame(width: 60 ,height: 40)
                        ZStack{
                            StrokeTextLabel(text: " LEVELS ", size: 34)
                                .frame(width: 189, height: 53)
                            Text(" LEVELS ")
                                .font(.custom("Knewave-Regular", size: 34))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                        }
                    }
                }
            }
            .onAppear {
                
            }
        }
        .navigationBarBackButtonHidden()
    }
    
}

struct SelectLevelView_Previews: PreviewProvider {
    static var previews: some View {
        SelectLevelView()
    }
}
