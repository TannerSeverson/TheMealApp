//
//  HeaderTableViewCell.swift
//  Potfolio
//
//  Created by Tanner Severson on 5/12/21.
//  Copyright © 2021 Tanner Severson. All rights reserved.
//

import UIKit

public protocol HeaderTableViewCellProtocol {
    func registerHeaderTableViewCell(for tableView: UITableView)
}

public extension HeaderTableViewCellProtocol {
    func registerHeaderTableViewCell(for tableView: UITableView) {
        tableView.register(UINib(nibName: HeaderTableViewCell.identifier, bundle: .main), forCellReuseIdentifier: HeaderTableViewCell.identifier)
    }
    func configureHeaderTableViewCell(label: String, textColor: UIColor?, icon: AssetProtocol?, tintColor: UIColor?, isSelectable: Bool, tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HeaderTableViewCell.identifier, for: indexPath) as? HeaderTableViewCell else { fatalError(#function) }
        cell.configureCell(label: label, textColor: textColor, icon: icon, tintColor: tintColor, isSelectable: isSelectable)
        return cell
    }
}

final class HeaderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
    }
    
    fileprivate func configureCell(label: String, textColor: UIColor?, icon: AssetProtocol?, tintColor: UIColor?, isSelectable: Bool) {
        self.selectionStyle = isSelectable ? .default : .none
        guard
            let icon = icon
        else {
            iconImageView.isHidden = true
            self.label.text = label
            self.label.textColor = textColor ?? .label
            return
        }
        
        self.label.text = label
        self.label.textColor = textColor ?? .label
        
        iconImageView.isHidden = false
        let tintColor = tintColor ?? .label
        iconImageView.image = icon.image?.withRenderingMode(.alwaysTemplate)
        iconImageView.tintColor = tintColor
    }
    
}
