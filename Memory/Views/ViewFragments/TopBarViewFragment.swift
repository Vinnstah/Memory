//
//  TopBarViewFragment.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-22.
//

import SwiftUI

struct TopBarViewFragment: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var navigateHome: Bool
    @Binding var navigateToSettings: Bool
    //    @Binding var navigateToPreviousScreen: Bool
    
    var body: some View {
        NavigationView {
            
            HStack {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .frame(width: 35, height: 35)
                    
                })
                    .buttonStyle(RoundButton())
                    .padding(.top, 25)
                
                Spacer()
                
                Button(action: {
                    navigateHome.toggle()
                }
                       , label: {
                    Image(systemName: "house.circle")
                        .resizable()
                        .frame(width: 35, height: 35)
                    
                })
                
                    .buttonStyle(RoundButton())
                    .padding(.top, 25)
                
                Spacer()
                
                Button(action: {
                    navigateToSettings.toggle()
                }, label: {
                    Image(systemName: "gearshape")
                        .resizable()
                        .frame(width: 35, height: 35)
                    
                })
                
                    .buttonStyle(RoundButton())
                    .padding(.top, 25)
            }
            .padding()
            .foregroundColor(.white)
            .background(
                Color.ForestTheme().secondaryBackgroundColor.ignoresSafeArea(edges: .top)
            )
            .cornerRadius(50, corners: [.bottomLeft, .bottomRight])
        }
        .navigationBarHidden(true)
        .frame(width: 500, height: 200, alignment: .center)
    }
}

//struct CustomNavigationView<Content: View, Destination : View>: View {
//
//    let destination : Destination
//    let isRoot : Bool
//    let isLast : Bool
//    let color : Color
//    let content: Content
//    @State var active = false
//    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
//
//    init(destination: Destination, isRoot : Bool, isLast : Bool,color : Color, @ViewBuilder content: () -> Content) {
//        self.destination = destination
//        self.isRoot = isRoot
//        self.isLast = isLast
//        self.color = color
//        self.content = content()
//    }
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                ZStack {
//                    HStack {
//                        Image(systemName: "arrow.left")
//                            .frame(width: 30)
//                            .onTapGesture(count: 1, perform: {
//                                self.mode.wrappedValue.dismiss()
//                            }).opacity(isRoot ? 0 : 1)
//                        Spacer()
//                        Image(systemName: "house.circle")
//                            .resizable()
//                            .frame(width: 35, height: 35)
//                        NavigationLink(
//                            destination: StartScreen().navigationBarHidden(true)
//                                .navigationBarHidden(true),
//                            isActive: self.$active,
//                            label: {
//                                //no label
//                            })
//                        Spacer()
//                        Image(systemName: "arrow.right")
//                            .frame(width: 30)
//                            .onTapGesture(count: 1, perform: {
//                                self.active.toggle()
//                            })
//                            .opacity(isLast ? 0 : 1)
//                        NavigationLink(
//                            destination: destination.navigationBarHidden(true)
//                                .navigationBarHidden(true),
//                            isActive: self.$active,
//                            label: {
//                                //no label
//                            })
//                    }
//                    .padding([.leading,.trailing], 8)
//                    .frame(width: UIScreen.screenWidth)
//                    .font(.system(size: 22))
//                }
//            }
//            .padding()
//            .foregroundColor(.white)
//            .background(
//                Color.ForestTheme().secondaryBackgroundColor.ignoresSafeArea(edges: .top)
//            )
//            .cornerRadius(50, corners: [.bottomLeft, .bottomRight])
//        }
//    }
//}

struct CustomNavigationView<Content: View, Destination : View>: View {
    let destination : Destination
    let isRoot : Bool
    let isLast : Bool
    let content: Content
    @State var active = false
    @State var navigateHome = false
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    init(destination: Destination, isRoot : Bool, isLast : Bool, @ViewBuilder content: () -> Content) {
        self.destination = destination
        self.isRoot = isRoot
        self.isLast = isLast
        self.content = content()
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack {
                    Spacer()
                    ZStack {
                        HStack {
                            Image(systemName: "arrow.left")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .onTapGesture(count: 1, perform: {
                                    self.mode.wrappedValue.dismiss()
                                }).opacity(isRoot ? 0 : 1)
                            Spacer()
                            Image(systemName: "house.circle")
                                .resizable()
                                .buttonStyle(RoundButton())
                                .frame(width: 50, height: 50)
                                .padding(.bottom, 20)
                                .onTapGesture(count: 1, perform: {
                                    self.navigateHome.toggle()

                                })
                            NavigationLink(
                                destination: StartScreen().navigationBarHidden(true)
                                    .navigationBarHidden(true),
                                isActive: self.$navigateHome,
                                label: {
                                    //no label
                                })
                            Spacer()
                            Image(systemName: "gearshape")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .onTapGesture(count: 1, perform: {
                                    self.active.toggle()
                                })
                                .opacity(isLast ? 0 : 1)
                                .sheet(isPresented: self.$active) {
                                    SettingsView()
                                }
//                            NavigationLink(
//                                destination: destination.navigationBarHidden(true)
//                                    .navigationBarHidden(true),
//                                isActive: self.$active,
//                                label: {
//                                    //no label
//                                })
                        }
                        .padding([.leading,.trailing], 8)
                        .frame(width: geometry.size.width)
                        .font(.system(size: 22))
                        
//                        Spacer()
                    }
                    .edgesIgnoringSafeArea(.top)
                    .frame(width: geometry.size.width, height: 70)
                    .cornerRadius(50, corners: [.bottomLeft, .bottomRight])
                    
                    self.content
                }
            }
            .background(
                Color.ForestTheme().secondaryBackgroundColor.ignoresSafeArea(edges: .top)
            )
            .navigationBarHidden(true)
        }
    }
}
