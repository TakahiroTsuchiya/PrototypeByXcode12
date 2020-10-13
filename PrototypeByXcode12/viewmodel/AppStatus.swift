//
//  AppStatus.swift
//  PrototypeByXcode12
//
//  Created by TakahiroTsuchiya on 2020/10/10.
//

enum AppStatus: String {
  case maintenance = "now maintenance"
  case forceUpdate = "please update, go app store"
  case agree = "i agree use this app"
  case disagree = "let me know this app"
  case processing = "now app access web/api server. Now Loading ..."
  case animation = "while animating"
}
