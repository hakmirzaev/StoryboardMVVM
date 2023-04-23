//
//  CreateViewController.swift
//  StoryboardPost
//
//  Created by Bekhruz Hakmirzaev on 15/04/23.
//

import UIKit

class CreateViewController: BaseViewController {
    
    @IBOutlet weak var titleLabel: UITextField!
    @IBOutlet weak var bodyLabel: UITextField!
    var viewModel = CreateViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
        bindViewModel()
    }
    
    func initView() {
        title = "Create Post"
    }
    
    func callHomeViewController() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func bindViewModel(){
        viewModel.controller = self
    }
    
    @IBAction func createButton(_ sender: Any) {
        if titleLabel.text != nil && bodyLabel.text != nil {
            viewModel.apiPostCreate(post: Post(title: titleLabel.text!, body: bodyLabel.text!), handler: { response in
                if response {
                    self.callHomeViewController()
                }
            })
        }
    }
    
}
