//
//  TitleDetailPresenter.swift
//  ProjectVIPArquitecture
//
//  Created by user on 21/03/23.
//

import Foundation

protocol TitleDetailPresenter: AnyObject {
    
    func interactor(didRetrieveTitle title: Title)
    func interactor(didFailRetrieveTitle error:Error)
}

class TitleDetailPresenterImplemetation: TitleDetailPresenter {
    
    var viewController: TitleDetailPresenterOutput?
    
    func interactor(didRetrieveTitle title: Title) {
        let titleString = title.text
        viewController?.presenter(didRetrieveItem: titleString ?? "")
    }
    
    func interactor(didFailRetrieveTitle error: Error) {
        viewController?.presenter(didFailRetrieveItem: error.localizedDescription)
    }
    
    
}
