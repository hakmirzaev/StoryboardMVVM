//
//  EditViewController.swift
//  StoryboardPost
//
//  Created by Bekhruz Hakmirzaev on 15/04/23.
//

import UIKit

class EditViewController: BaseViewController {

    var post: Post = Post(title: "", body: "")
    @IBOutlet weak var titleLabel: UITextField!
    @IBOutlet weak var bodyLabel: UITextField!
    var viewModel = EditViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initView()
        bindViewModel()
    }
    
    func callHomeViewController() {
        dismiss(animated: true, completion: nil)
    }
    
    func initView() {
        titleLabel.text = post.title!
        bodyLabel.text = post.body!
        
        title = "Edit Post"
    }
    
    func bindViewModel(){
        viewModel.controller = self
    }

    @IBAction func saveButton(_ sender: Any) {
        if titleLabel.text != nil && bodyLabel.text != nil {
            viewModel.apiPostEdit(post: Post(id: post.id!, title: titleLabel.text!, body: bodyLabel.text!), handler: { response in
                if response {
                    self.callHomeViewController()
                }
            })
        }
    }

}
