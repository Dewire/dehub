//
//  BaseScene.swift
//  DeHub
//
//  Created by Kalle Lindström on 11/06/16.
//  Copyright © 2016 Dewire. All rights reserved.
//

import UIKit
import Model
import RxSwift

public class BaseScene {
  
  let bag = DisposeBag()
  
  weak var stageRef: UIViewController!
  
  let services: Services
    
  public init(services: Services) {
  	self.services = services
  }
  
  deinit {
    print("🗑 \(self.dynamicType) deinit")
  }
  
  public func stage() -> UIViewController {
    let stage = createStage()
    stageRef = stage
    return stage
  }
  
  func createStage() -> UIViewController {
    fatalError("must be overriden by subclass")
  }
  
  func referToSelf() {
    
  }
}
