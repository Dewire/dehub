//
//  State.swift
//  DeHub
//
//  Created by Kalle Lindström on 11/06/16.
//  Copyright © 2016 Dewire. All rights reserved.
//

import Foundation
import RxSwift

public class State {
  
  public var gists: Variable<[GistEntity]?> = Variable(nil)
  
  public func reset() {
    gists = Variable(nil)
  }
  
}
