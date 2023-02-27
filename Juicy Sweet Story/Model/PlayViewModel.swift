//
//  PlayViewModel.swift
//  Juicy Sweet Story
//
//  Created by Олег Коваленко on 25.02.2023.
//

import SwiftUI

struct PlayViewModel: View {
    
    
    // Setup Lazy V Grid colums
    let colums: [GridItem] = [
        .init(.fixed(85), spacing: 0, alignment: nil),
        .init(.fixed(85), spacing: 0, alignment: nil),
        .init(.fixed(85), spacing: 0, alignment: nil),
        .init(.fixed(85), spacing: 0, alignment: nil)
    ]
    
    // Environment variable
    @Environment (\.presentationMode) var presentation
    
    // Animation variable
    @State var isShow: Bool = false
    
    // Helper variable
    @State var helper = HelperModel()
    @State var lvl = LvLModel()
    @State var image = UIImage()
    
    // Image variable
    @State var imageArray: [UIImage] = []
    @State var imageArrayWin: [UIImage] = []
    
    // Timer variable
    @State var timeRemaining = 0
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    // Interactive
    @State var isSelect = false
    @State var selectedFirstImage = -1
    @State var selectedSecondImage = -1
    @State var selectedBuffer = UIImage()
    @Binding var lvlSelected: String
    @State var isGameOver = false
    @State var isWin = false
    
    var body: some View {
        NavigationView{
            VStack{
                VStack{
                    
// Lazy V Grid section
                    
                    LazyVGrid(columns: colums,alignment: .center,spacing: 0) {
                        ForEach(0..<imageArray.count, id:\.self){ index in
                            if imageArray.indices.contains(index) {
                                Image(uiImage: imageArray[index])
                                    .resizable()
                                    .frame(width: 85, height: 85)
                                    .overlay {
                                        Rectangle()
                                            .stroke(.white,lineWidth: 4)
//                                        Rectangle()
//                                            .fill(isSelect ? .black.opacity(0.0) : .black.opacity(0.7))
                                    }
                                
// Interactions with elements in grid
                                
                                    .onTapGesture {
                                        if isSelect{
                                            print("\(selectedSecondImage) Second")
                                            selectedSecondImage = index
                                            selectedBuffer = imageArray[selectedSecondImage]
                                            imageArray[selectedSecondImage] = imageArray[selectedFirstImage]
                                            imageArray[selectedFirstImage] = selectedBuffer
                                            isSelect = false
                                        } else {
                                            
                                            print("\(index) First")
                                            selectedFirstImage = index
                                            isSelect = true
                                        }
                                    }
                            }else{
                                ProgressView()
                            }
                        }
                    }
                    .frame(width: 340, height: 340, alignment: .center)
                    .overlay {
                        Image("frame")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .disabled(true)
                            .allowsHitTesting(false)
                        
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 60))
                    .padding(.top,20)
                }
                .frame(width: UIScreen.main.bounds.width, height: 500, alignment: .center)
                Spacer()
                
// Helper Original Image for game
                
                Image(lvlSelected)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 226, height: 226)
                    .overlay {
                        Image("frame")
                            .resizable()
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 45))
                Spacer()
            }
            
// Background and ToolBar section
            
            .background(
                Image("backgroundImage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .toolbar{
                        ToolbarItem(placement: .navigationBarLeading) {
                            HStack{
                                
// Backward button -> SelectLevelView
                                
                                Button{
                                    self.presentation.wrappedValue.dismiss()
                                    self.isShow = false
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
                                
// Restart LvL Button
                                
                                Button{
                                    SetTimer()
                                    CreatePuzzle(lvl: lvlSelected)
                                    
                                } label: {
                                    Image("reload")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 30,height: 30)
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
                        
// LvL ToolTip
                        
                        ToolbarItem(placement: .navigationBarTrailing) {
                            HStack{
                                ZStack{
                                    StrokeTextLabel(text: "LVL-1", size: 24)
                                    Text("LVL-1")
                                        .foregroundColor(.white)
                                        .font(.custom("Knewave-Regular", size: 24))
                                }
                                .background(
                                    RoundedRectangle(cornerRadius: 25)
                                        .fill(.white)
                                )
                                .overlay {
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(helper.gradient, lineWidth: 5)
                                }
                                .frame(width: 100,height: 35)
                                
// Timer section
                                
                                ZStack(alignment: .center){
                                    //StrokeTextLabel(text: "\(timeRemaining)", size: 24)
                                    Text(" \(TimerFormater(seconds:timeRemaining)) ")
                                    //.multilineTextAlignment(.leading)
                                        .foregroundColor(Color("gradientColor1"))
                                        .font(.custom("Knewave-Regular", size: 24))
                                        .onReceive(timer) { _ in
                                            if imageArray == imageArrayWin{
                                                isWin = true
                                                timer.upstream.connect().cancel()
                                            }
                                            if timeRemaining > 0 {
                                                timeRemaining -= 1
                                            } else {
                                                withAnimation(.spring()){
                                                    isGameOver = true
                                                }
                                            }
                                        }
                                    
                                }
                                
                                .frame(width: 100,height: 35)
                                .background(
                                    RoundedRectangle(cornerRadius: 25)
                                        .fill(.white)
                                )
                                .overlay {
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(helper.gradient, lineWidth: 5)
                                }
                                
                            }
                            
                        }
                    }
                
            )
            .onAppear(){
                CreatePuzzle(lvl: lvlSelected)
                SetTimer()
            }
            
        }
        
// Overlays Win or loss view panel
        
        .overlay(content: {
            LevelComplited.opacity(isGameOver ? 1.0 : 0.0 )
            LevelComplited.opacity(isWin ? 1.0 : 0.0)
            
        })
        .navigationBarBackButtonHidden()
        
        
        
    }
    
// Start Timer Function
    
    func SetTimer(){
        let newStr = lvlSelected.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        timeRemaining = 190 - 10*Int(newStr)!
        //timeRemaining = 5
    }
    
// Create Puzzle from Image to array of images
    
    func CreatePuzzle(lvl: String){
        
        let gameImage = UIImage(named: lvl)!.rebuildImage(imagesize: 350, row: 4, col: 4)
        let width = gameImage.size.width-5
        let imageConvert = gameImage.cgImage
        let sizeImage = width / 4
        for i in 0...4 - 1 {
            for j in 0...4 - 1 {
                let cropImage = imageConvert!.cropping(to: CGRect(x: CGFloat(j)*sizeImage, y: CGFloat(i)*sizeImage, width: sizeImage, height: sizeImage))
                imageArray.append(UIImage(cgImage: cropImage!))
            }
        }
        imageArrayWin = imageArray
        imageArray.shuffle()
    }

// Level Loss View
    
    var LevelFailed: some View {
        VStack{
            Spacer()
                .frame(height: 100)
            VStack{
                ZStack{
                    Image("characterMagic")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 385,height: 385)
                        .offset(y:-150)
                    Image("levelfailed")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 190, height: 200)
                }
            }
            .frame(height: 200)
            VStack{
                ZStack{
                    StrokeTextLabel(text: " TIME is UP ", size: 34)
                    Text(" TIME is UP ")
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .font(.custom("Knewave-Regular", size: 34))
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
                
// Backward arrow button -> SelectionLevelView
                
                Button{
                    
                    // Navigation forward button
                    self.presentation.wrappedValue.dismiss()
                   
                } label: {
                    Image("home")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: 60)
                        .padding(10)
                        .background(
                            Circle().fill(.white)
                        )
                        .overlay {
                            Circle().stroke(helper.gradient, lineWidth: 5)
                        }
                }
                .frame(width: 100 ,height: 100)
                
// Restart Level Button
                
                Button{
                    
                    // Navigation forward button
                    withAnimation(.spring()){
                        isGameOver = false
                    }
                    SetTimer()
                    CreatePuzzle(lvl: lvlSelected)
                    
                } label: {
                    Image("reload")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: 60)
                        .padding(10)
                        .background(
                            Circle().fill(.white)
                        )
                        .overlay {
                            Circle().stroke(helper.gradient, lineWidth: 5)
                        }
                        
                }
                .frame(width: 100  ,height: 100)
                
                
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
            .background(
                Rectangle().fill(helper.shadowGradient)
                    .ignoresSafeArea()
                )
            
    }
    
// Level Win View
    
    var LevelComplited: some View {
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
                    
// Current Time Sctore
                    
                    //StrokeTextLabel(text: " CURRENT TIME: \(TimerFormater(seconds:timeRemaining)) ", size: 32)
                    Text(" \(TimerFormater(seconds:timeRemaining)) ")
                        .foregroundColor(.pink)
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
                    
// Best Time Score this lvl
                    
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
                
// Backward Button -> SelectLevelView
                
                Button{
                    
                    // Navigation backward button
                    self.presentation.wrappedValue.dismiss()
                   
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
                
// Restart LvL button
                
                Button{
                    
                    // Reload lvl
                    withAnimation(.spring()){
                        isGameOver = false
                    }
                    SetTimer()
                    CreatePuzzle(lvl: lvlSelected)
                    
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
                
// Forward Button to next LvL
                
                Button{
                    //CreatePuzzle(lvl: lvl.lvlArray)
                    //lvl.lvlArray
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

// Extension UIImage for creating puzzle from Image

extension UIImage{
    func rebuildImage(imagesize: CGFloat ,row: CGFloat, col: CGFloat) -> UIImage {
        let newBuild = CGSize(width: imagesize, height: imagesize + (row - col)*imagesize/col)
        let rect = CGRect(x:0, y:0, width: newBuild.width, height: newBuild.height)
        UIGraphicsBeginImageContextWithOptions(newBuild, false, 1)
        self.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}
