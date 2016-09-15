//
//  Common.swift
//  DeHub
//
//  Created by Kalle Lindström on 15/09/16.
//  Copyright © 2016 Dewire. All rights reserved.
//

import Foundation
import Model
@testable import Scene
import RxSwift

class NopNetworkInteractor : P_NetworkInteractor {
  func login(username: String, password: String) -> Observable<Void> {
    return Observable.never()
  }
  
  func loadGists() -> Observable<Void> {
    return Observable.never()
  }
}

class SpyNavigation : Navigation {
  
  var presentedController: UIViewController?
  
  var pushedController: UIViewController?
  
  var dismissCalled = false
  
  func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)?) {
    
    presentedController = viewControllerToPresent
  }
  
  func dismiss(animated flag: Bool, completion: (() -> Void)?) {
    dismissCalled = true
  }
  
  func pushController(_ viewController: UIViewController, animated: Bool) {
    pushedController = viewController
  }
}
