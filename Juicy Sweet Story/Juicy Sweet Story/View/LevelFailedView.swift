////
////  LevelFailedView.swift
////  Juicy Sweet Story
////
////  Created by Олег Коваленко on 26.02.2023.
////
//
//import SwiftUI
//
//struct LevelFailedView: View {
//
//    // Helper variable
//    @State var helper = HelperModel()
//
//
//    var body: some View {
//        VStack{
//            Spacer()
//                .frame(height: 100)
//            VStack{
//                ZStack{
//                    Image("characterMagic")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 385,height: 385)
//                        .offset(y:-150)
//                    Image("levelfailed")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 190, height: 200)
//                }
//            }
//
//
//            .frame(height: 200)
//            VStack{
//                ZStack{
//                    StrokeTextLabel(text: " TIME is UP ", size: 34)
//                    Text(" TIME is UP ")
//                        .foregroundColor(.white)
//                        .multilineTextAlignment(.center)
//                        .font(.custom("Knewave-Regular", size: 34))
//                }
//                .frame(width: 350, height: 60)
//                .background(
//                    RoundedRectangle(cornerRadius: 25)
//                        .fill(.white)
//                )
//                .overlay {
//                    RoundedRectangle(cornerRadius: 25)
//                        .stroke(helper.gradient, lineWidth: 5)
//                }
//            }
//            HStack{
//                Button{
//
//                    // Navigation forward button
//                    SelectLevelView()
//
//                } label: {
//                    Image("home")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 60, height: 60)
//                        .padding(10)
//                        .background(
//                            Circle().fill(.white)
//                        )
//                        .overlay {
//                            Circle().stroke(helper.gradient, lineWidth: 5)
//                        }
//                }
//                .frame(width: 100 ,height: 100)
//                Button{
//
//                    // Navigation forward button
//
//
//                } label: {
//                    Image("reload")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 60, height: 60)
//                        .padding(10)
//                        .background(
//                            Circle().fill(.white)
//                        )
//                        .overlay {
//                            Circle().stroke(helper.gradient, lineWidth: 5)
//                        }
//
//                }
//                .frame(width: 100  ,height: 100)
//
//
//            }
//        }
//        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//
//            .background(
//                Rectangle().fill(helper.shadowGradient)
//                    .ignoresSafeArea()
//                )
//
//    }
//}
//
//struct LevelFailedView_Previews: PreviewProvider {
//    static var previews: some View {
//        LevelFailedView()
//    }
//}
