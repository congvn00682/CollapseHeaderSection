//
//  SectionHeaderView.swift
//  CollapseHeaderSection
//
//  Created by Chung on 5/29/18.
//  Copyright © 2018 Chung. All rights reserved.
//

import UIKit

protocol UISectionHeaderViewDelegate: class {
    func didSelectedSection(at section: Int)
}

class SectionHeaderView: UIView {

    @IBOutlet weak var textLabel: UILabel!
    static var instanceFromNib : SectionHeaderView {
        let uiNib = UINib(nibName: "SectionHeaderView", bundle: nil)
        return uiNib.instantiate(withOwner: nil, options: nil)[0] as! SectionHeaderView
    }

    weak var delegate: UISectionHeaderViewDelegate?
    var section: Int!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func selectedSection(_ sender: UIButton) {
        if section != nil {
            delegate?.didSelectedSection(at: section)
        }
    }
}
