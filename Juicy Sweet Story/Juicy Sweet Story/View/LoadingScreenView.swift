//
//  LoadingScreenView.swift
//  Juicy Sweet Story
//
//  Created by Олег Коваленко on 25.02.2023.
//

import SwiftUI
import UIKit

struct LoadingScreenView: View {
    
    var body: some View {
        
        VStack{
            Spacer()
                .frame(height: 100)
            Image("candys")
                .resizable()
                .frame(width: 350, height: 233)
            Image("startImage")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Spacer()
            ZStack{
                StrokeTextLabel(text: "Loading...", size: 35)
                    .frame(width: 160, height: 50)
                Text("Loading...")
                    .font(.custom("Knewave-Regular", size: 35))
                    .foregroundColor(.white)
                    .frame(width: 160, height: 50)
                    
            }
        }
        .background(
            Image("backgroundImage")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        )
    }
}

struct LoadingScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingScreenView()
    }
}
