//
//  Router.swift
//  MyGymApp
//
//  Created by Gabriel Leite on 20/12/24.
//

import Foundation
import Observation

@Observable
class Router {
    var path: [RouterValue]
    
    init(){
        self.path = []
    }
    
    func goTo(view: RouterValue) {
        guard path.last != view else { return }
        path.append(view)
    }
    
    func goBack() {
        path.removeLast()
    }
    
    func goToRoot() {
        path = []
    }
}

enum Screen: Hashable {
    case Add
}

struct RouterValue: Hashable {
    let view: Screen
}
