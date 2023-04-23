//
//  EditViewModel.swift
//  StoryboardPost
//
//  Created by Bekhruz Hakmirzaev on 23/04/23.
//

import Foundation
import Bond

class EditViewModel {
    var controller: BaseViewController!
    
    func apiPostEdit(post: Post, handler: @escaping (Bool) -> Void) {
        controller.showProgress()
        AFHttp.put(url: AFHttp.API_POST_UPDATE + (post.id)!, params: AFHttp.paramsPostCreate(post: post), handler: { response in
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
