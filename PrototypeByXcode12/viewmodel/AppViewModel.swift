//
//  AppViewModel.swift
//  PrototypeByXcode12
//
//  Created by TakahiroTsuchiya on 2020/10/10.
//
import SwiftUI

class AppViewModel: ObservableObject {

  @Published private (set) public var appStatus: AppStatus {
    didSet {
//      print("didSet value change: \(oldValue) -> \(appStatus)")
//      print("didSet value: \(appStatus.rawValue)")
      UserDefaults.standard.set(appStatus.rawValue, forKey: "appStatus")
//      print("UserDefaults value: " + UserDefaults.standard.string(forKey: "appStatus")!.description)
    }
  }

  @Published public var isProcessing: Bool = false

  // 0: disagree, 1: agree, 2: forceUpdate, 3: mainenance, 4: processing
  @AppStorage("appState") var appState = 0 {
    didSet {
//      print("didSet value change: \(oldValue) -> \(appState)")
//      let nowValue = UserDefaults.standard.integer(forKey: "appState")
//      print("from userDefaults: \(nowValue)")
    }
  }

  func isMaintenance() -> Bool {
    return getSate() == 3
  }
  func isForceUpdate() -> Bool {
    return getSate() == 2
  }
  func isAgree() -> Bool {
    return getSate() == 1
  }
  func isDisagree() -> Bool {
    return getSate() == 0
  }

  private func getSate() -> Int {
    return UserDefaults.standard.integer(forKey: "appState")
  }

  func setMaintenance() {
    self.appStatus = .maintenance
    self.appState = 3
  }
  func setForceUpdate() {
    self.appStatus = .forceUpdate
    self.appState = 2
  }
  func setAgree() {
    self.appStatus = .agree
    self.appState = 1
  }
  func setDisagree() {
    self.appStatus = .disagree
    self.appState = 0
  }

  func startProcessing() {
    self.appStatus = .processing
    self.isProcessing = true
  }

  func stopProcessing() {
    self.isProcessing = false
    setAgree()
  }

  func callAPI() {
    startProcessing()
    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
      (1..<10).forEach{ i in
//        print("number : \(i)")
      }
      self.stopProcessing()
    }
  }

  init() {
    switch UserDefaults.standard.string(forKey: "appStatus") {
      case AppStatus.maintenance.rawValue:
        self.appStatus = .maintenance
      case AppStatus.forceUpdate.rawValue:
        self.appStatus = .forceUpdate
      case AppStatus.agree.rawValue:
        self.appStatus = .agree
      case AppStatus.disagree.rawValue:
        self.appStatus = .disagree
      default:
        self.appStatus = .disagree
    }
    let nowValue = UserDefaults.standard.integer(forKey: "appState")
    print("[init] from userDefaults: \(nowValue)")
  }
}
