//
//  Director.swift
//  DeHub
//
//  Created by Kalle Lindström on 01/07/16.
//  Copyright © 2016 Dewire. All rights reserved.
//

import Foundation
import RxSwift

public class ViewModel: EventChannelProvider {
  
  deinit {
    print("🗑 \(type(of: self)) deinit")
  }
  
  let eventChannel = EventChannel()
}
