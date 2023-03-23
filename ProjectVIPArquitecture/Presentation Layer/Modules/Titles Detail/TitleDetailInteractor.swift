//
//  TitleDetailInteractor.swift
//  ProjectVIPArquitecture
//
//  Created by user on 21/03/23.
//

import UIKit

protocol TitleDetailInteractor: AnyObject{
    
    var titleId: String? {get}
    
    func viewDidLoad()
}

class TitleDetailInteractorImplementation: TitleDetailInteractor {
    
    var titleId: String?
    
    var presenter: TitleDetailPresenter?
    
    private let titlesService = TitlesServiceImplementation()
    
    func viewDidLoad() {
        
        do{
            if let title = try titlesService.getTitle(with: self.titleId!) {
                self.presenter?.interactor(didRetrieveTitle: title)
            }
        } catch {
            
            self.presenter?.interactor(didFailRetrieveTitle: error)
        }
        
    }

}
