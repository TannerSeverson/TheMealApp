//
//  Icons.swift
//  TheMealApp
//
//  Created by Tanner Severson on 3/16/22.
//


import UIKit

public protocol IconTableViewCellProtocol {
    func registerIconTableViewCell(for tableView: UITableView)
}


public extension IconTableViewCellProtocol {
    func registerIconTableViewCell(for tableView: UITableView) {
        tableView.register(UINib(nibName: IconTableViewCell.identifier, bundle: .main), forCellReuseIdentifier: IconTableViewCell.identifier)
    }
    func configureIconTableViewCell(label: String, showDisclosure: Bool, icon: AssetProtocol, tintColor: UIColor?, tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: IconTableViewCell.identifier, for: indexPath) as? IconTableViewCell
        else { fatalError(#function) }
        cell.configure(label: label, showDisclosure: showDisclosure, icon: icon, tintColor: tintColor)
        return cell
    }
    func configureIconTableViewCell(label: String, showDisclosure: Bool, icon: Icons, tintColor: UIColor?, tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: IconTableViewCell.identifier, for: indexPath) as? IconTableViewCell
        else { fatalError(#function) }
        cell.configure(label: label, showDisclosure: showDisclosure, icon: icon, tintColor: tintColor)
        return cell
    }
}

final class IconTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
    }
    
    fileprivate func configure(label: String, showDisclosure: Bool, icon: AssetProtocol, tintColor: UIColor?) {
        self.label.text = label
        setAccessoryType(with: showDisclosure)
        iconImageView.image = icon.image
        iconImageView.tintColor = tintColor ?? .label
    }
    
    
}
