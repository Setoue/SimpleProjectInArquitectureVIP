//
//  TitleDetailView.swift
//  ProjectVIPArquitecture
//
//  Created by user on 21/03/23.
//

import UIKit

class TitleDetailView: UIView {
    
    //MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: - Actions
    public func updateLabel(with text: String){
        titleLabel.text = text
    }
    
    //MARK: - Properties
    lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont(name: "Avenir", size: 25)
        title.textColor = .black
        title.numberOfLines = 0
        return title
    }()
    
    
}

//MARK: - setupUI
extension TitleDetailView {
    
    private func setupUI(){
        
        if #available(iOS 13.0, *) {
            
            overrideUserInterfaceStyle = .light
        }
        
        self.backgroundColor = .white
        
        self.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            
            //titleLabel
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }
}


