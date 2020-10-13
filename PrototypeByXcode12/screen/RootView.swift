//
//  RootView.swift
//  PrototypeByXcode12
//
//  Created by TakahiroTsuchiya on 2020/09/20.
//

import SwiftUI

struct RootView: View {
  
  @ObservedObject private var appViewModel = AppViewModel()
  
  var body: some View {
    
    ZStack {
      
      // create marge view by struct?
      ActivityIndicatorView(isAnimating: $appViewModel.isProcessing)
      AllScreenCoverView(isProcessing: $appViewModel.isProcessing)
      
      VStack {
        
        Spacer()
        
        VStack {
          Spacer()

          Button("maintenance") { self.appViewModel.setMaintenance() }
          Button("force Update") { self.appViewModel.setForceUpdate() }
          Button("agree") { self.appViewModel.setAgree() }
          Button("disagree") { self.appViewModel.setDisagree() }
          Button("call api") { self.appViewModel.callAPI() }

          Spacer()
        }

        Spacer()

        Image(systemName: "chevron.right.circle")
//          .imageScale(.medium)
//            .foregroundColor(appViewModel.isProcessing ? .gray : .blue)
          .scaleEffect(appViewModel.isProcessing ? 1.0 : 0.0)
          .rotationEffect(.degrees(appViewModel.isProcessing ? 360.0 * 1 : 0.0))
          .padding()
          .animation(.easeInOut, value: appViewModel.isProcessing)

        Spacer()

        Text(appViewModel.appStatus.rawValue)

        Spacer()

        if (appViewModel.isProcessing) {
        } else {
          if (appViewModel.isDisagree()) {
          }
          if (appViewModel.isAgree()) {
          }
          if (appViewModel.isForceUpdate()) {
          }
          if (appViewModel.isMaintenance()) {
          }
        }
        
        Spacer()
        
      }
    }.disabled(self.appViewModel.isProcessing)
  }
  
  #if DEBUG
  struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      RootView().environmentObject(AppViewModel())
    }
  }
  #endif
}
