//
//  TitleDetailConfigurator.swift
//  ProjectVIPArquitecture
//
//  Created by user on 21/03/23.
//

import Foundation

class TitleDetailConfigurator {
    
    static func configureModule(titleId: String, viewController: TitleDetailViewController) {
        
        let view = TitleDetailView()
        let interactor = TitleDetailInteractorImplementation()
        let presenter = TitleDetailPresenterImplemetation()
        
        interactor.titleId = titleId
        
        viewController.titleDetailView = view
        viewController.interactor = interactor
        
        interactor.presenter = presenter
        
        presenter.viewController = viewController
        
    }
}
