//
//  ActivityIndicator.swift
//  PrototypeByXcode12
//
//  Created by TakahiroTsuchiya on 2020/10/10.
//
import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
  
  @Binding var isAnimating: Bool
  
  let style: UIActivityIndicatorView.Style
  
  func makeUIView(context: Context) -> UIActivityIndicatorView {
    let indigatorView = UIActivityIndicatorView(style: style)
//    indigatorView.color = color
    return indigatorView
  }
  
  func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
//    print("updateUIView : \(self.isAnimating)")
    isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
  }
}
