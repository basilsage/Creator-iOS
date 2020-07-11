//
//  CollectibleDetailsTableViewCell.swift
//  Creator
//
//  Created by DJ Satoda on 7/10/20.
//  Copyright © 2020 DJ Satoda. All rights reserved.
//

import Foundation
import UIKit

class CollectibleDetailsTableViewCell : UITableViewCell {
    
    let detailQuestion : UILabel = {
        let dq = UILabel()
        
        dq.textAlignment = .left
        
        return dq
    }()
    
    let detailAnswer : UILabel = {
        let da = UILabel()
        
        da.textAlignment = .right

        return da
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(detailQuestion)
        detailQuestion.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 10, paddingRight: 0, width: frame.width / 2, height: 0)
        
        
        addSubview(detailAnswer)
        detailAnswer.anchor(top: topAnchor, left: nil, bottom: bottomAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 10, paddingRight: 10, width: frame.width / 2, height: 0)
        

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
