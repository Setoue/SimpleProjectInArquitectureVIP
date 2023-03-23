//
//  TitleDetailViewController.swift
//  ProjectVIPArquitecture
//
//  Created by user on 21/03/23.
//

import UIKit

protocol TitleDetailPresenterOutput: AnyObject {
    
    func presenter(didRetrieveItem item: String)
    func presenter(didFailRetrieveItem message: String)
}

class TitleDetailViewController: UIViewController {
    
    //MARK: - Lifecycle Methods
    override func loadView() {
        super.loadView()
        self.view = titleDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.interactor?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    //MARK: - Properties
    var titleDetailView: TitleDetailView?
    var interactor: TitleDetailInteractor?
    weak var presenter: TitleDetailPresenter?
    
}

extension TitleDetailViewController: TitleDetailPresenterOutput {
    
    func presenter(didRetrieveItem item: String) {
        titleDetailView?.updateLabel(with: item)
    }
    
    func presenter(didFailRetrieveItem message: String) {
        showError(with: message)
    }
}

