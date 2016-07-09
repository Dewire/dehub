//
//  HomeDirector.swift
//  DeHub
//
//  Created by Kalle Lindström on 21/06/16.
//  Copyright © 2016 Dewire. All rights reserved.
//

import Foundation
import Model

class HomeDirector : BaseDirector {
  
  private let actions: HomeStage.Actions
  private let network: P_NetworkInteractor
  private let state: State
  
  init(actions: HomeStage.Actions, state: State, network: P_NetworkInteractor) {
    
    self.actions = actions
    self.network = network
    self.state = state
    super.init()
    
    observeLogout()
    observeUser()
    getUser()
  }
  
  private func observeLogout() {
    actions.logout
      .take(1)
      .bindNext { _ in
  			NSNotificationCenter.defaultCenter().postNotificationName(
      		"Logout",
          object: nil)
    	}
    	.addDisposableTo(bag)
  }
  
  private func observeUser() {
    state.user.asDriver().driveNext { [unowned self] user in
      guard let user = user else { return }
      self.actions.username.onNext(user.username)
      self.actions.reposCount.onNext(String(user.publicRepos))
      self.actions.gistsCount.onNext(String(user.publicGists))
      self.actions.followers.onNext(String(user.followers))
      self.actions.following.onNext(String(user.following))
      
      if let name = user.name {
        self.actions.realName.onNext(name)
      }
    }
    .addDisposableTo(bag)
  }
  
  private func getUser() {
    network.getUser().subscribeError { _ in
      print("getUser error")
    }
    .addDisposableTo(bag)
  }
}