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


struct CustomNavigationView<Content: View, Destination : View>: View {
    let destination : Destination
    let isRoot : Bool
    let isLast : Bool
    let content: Content
    @State var active = false
    @State var navigateHome = false
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var timer: Int?
    var timesClicked: Int?
    
    init(destination: Destination, isRoot : Bool, isLast : Bool, timer: Int? = nil, timesClicked: Int? = nil, @ViewBuilder content: () -> Content) {
        self.destination = destination
        self.isRoot = isRoot
        self.isLast = isLast
        self.timer = timer
        self.timesClicked = timesClicked
        self.content = content()
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack {
//                    Spacer()
                    ZStack {
                        HStack {
                            Image(systemName: "arrow.left")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .onTapGesture(count: 1, perform: {
                                    self.mode.wrappedValue.dismiss()
                                }).opacity(isRoot ? 0 : 1)
                            Spacer()
                            
                            if let timer = timer {
                            TimeElapsedView(timer: timer)
                            }
                            
                            Spacer()
                            
                            if let timesClicked = timesClicked {
                                Text("Times clicked: \(timesClicked)")
                                    .font(.system(size: 12))
                                    .foregroundColor(Color.ForestTheme().complementaryColor)
                            }

//                            Text("Times clicked: \(timesClicked)")
//
//                            Image(systemName: "house.circle")
//                                .resizable()
//                                .buttonStyle(RoundButton())
//                                .frame(width: 50, height: 50)
//                                .padding(.bottom, 20)
//                                .onTapGesture(count: 1, perform: {
//                                    self.navigateHome.toggle()
//
//                                })
//                            NavigationLink(
//                                destination: StartScreen().navigationBarHidden(true)
//                                    .navigationBarHidden(true),
//                                isActive: self.$navigateHome,
//                                label: {
//                                    //no label
//                                })
//                            Spacer()
//                            Image(systemName: "gearshape")
//                                .resizable()
//                                .frame(width: 30, height: 30)
//                                .onTapGesture(count: 1, perform: {
//                                    self.active.toggle()
//                                })
//                                .opacity(isLast ? 0 : 1)
//                                .sheet(isPresented: self.$active) {
//                                    SettingsView()
//                                }

                        }
                        .padding([.leading,.trailing], 8)
                        .frame(width: geometry.size.width)
                        .font(.system(size: 22))
                        
                    }
                    .edgesIgnoringSafeArea(.top)
                    .frame(width: geometry.size.width, height: 40)
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
