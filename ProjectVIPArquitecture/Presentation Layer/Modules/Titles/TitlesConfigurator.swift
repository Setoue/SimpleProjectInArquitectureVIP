//
//  TitlesConfigurator.swift
//  ProjectVIPArquitecture
//
//  Created by user on 21/03/23.
//

import UIKit

class TitlesConfigurator {
    
    static func configureModule(viewController: TitlesViewController) {
        
        let view = TitlesView()
        let router = TitlesRouterImplementation()
        let interactor = TitlesInteractorImplementation()
        let presenter = TitlesPresenterImplementation()
        
        viewController.titlesView = view
        viewController.router = router
        viewController.interactor = interactor
        
        interactor.presenter = presenter
        
        presenter.viewController = viewController
        
        router.navigationController = viewController.navigationController
    }
}

