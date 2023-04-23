//
//  CreateViewModel.swift
//  StoryboardPost
//
//  Created by Bekhruz Hakmirzaev on 23/04/23.
//

import Foundation
import Bond

class CreateViewModel {
    var controller: BaseViewController!
    
    func apiPostCreate(post: Post, handler: @escaping (Bool) -> Void) {
        controller.showProgress()
        AFHttp.post(url: AFHttp.API_POST_CREATE, params: AFHttp.paramsPostCreate(post: post), handler: { response in
            self.controller.hideProgress()
            switch response.result {
            case .success:
                print(response.result)
                handler(true)
            case let .failure(error):
                print(error)
                handler(false)
            }
        })
    }
}


