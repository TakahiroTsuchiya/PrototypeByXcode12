//
//  AllScreenCoverView.swift
//  PrototypeByXcode12
//
//  Created by TakahiroTsuchiya on 2020/10/10.
//
import SwiftUI

struct AllScreenCoverView: View {

  @Binding var isProcessing: Bool

  var body: some View {
    
    ZStack {
      Spacer()
      Color(.gray).opacity(self.isProcessing ? 0.08: 0.00)
      Spacer()
    }.edgesIgnoringSafeArea(.all)
  }
}

#if DEBUG
//struct AllScreenCoverView_Previews: PreviewProvider {
//    static var previews: some View {
//      AllScreenCoverView(appViewModel: AppViewModel())
//    }
//}
#endif
