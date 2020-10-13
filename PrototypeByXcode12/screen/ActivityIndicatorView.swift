//
//  ActivityIndicatorView.swift
//  PrototypeByXcode12
//
//  Created by TakahiroTsuchiya on 2020/10/10.
//
import SwiftUI

struct ActivityIndicatorView: View {

  @Binding var isAnimating: Bool

  var body: some View {
    
    ZStack {
      Spacer()
      ActivityIndicator(isAnimating: $isAnimating, style: .large)
      Spacer()
    }
  }
}
