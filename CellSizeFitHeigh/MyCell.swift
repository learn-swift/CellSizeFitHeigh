//
//  MyCell.swift
//  CellSizeFitHeigh
//
//  Created by Duc Nguyen on 2/16/16.
//  Copyright © 2016 ND NINJA. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {
	
	@IBOutlet weak var imageTop: UIImageView!
	@IBOutlet weak var labelContent: UILabel!
    
    @IBOutlet weak var imageHeightConstraint: NSLayoutConstraint!
	override func awakeFromNib() {
		super.awakeFromNib()
	}
	
	func setData(obj: MyObject) {
		if obj.image == "" {
			self.labelContent.text = obj.content
			self.imageTop.frame = CGRectMake(0, 0, self.imageTop.frame.width, 0);
			print("--")
		} else {
			print("+++")
			self.imageTop.image = UIImage(named: obj.image!)
			self.labelContent.text = obj.content
		}
	}
	
	override func setSelected(selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
		
	}
}