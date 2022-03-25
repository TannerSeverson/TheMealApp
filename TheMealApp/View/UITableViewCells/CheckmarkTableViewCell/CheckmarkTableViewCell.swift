//
//  CheckmarkTableViewCell.swift
//  TheMealApp
//
//  Created by Tanner Severson on 3/17/22.
//

import UIKit

public protocol CheckmarkTableViewCellProtocol {
    func registerCheckmarkTableViewCell(for tableView: UITableView)
}

public extension CheckmarkTableViewCellProtocol {
    func registerCheckmarkTableViewCell(for tableView: UITableView) {
        tableView.register(UINib(nibName: CheckmarkTableViewCell.identifier, bundle: .main), forCellReuseIdentifier: CheckmarkTableViewCell.identifier)
    }
    func configureCheckmarkTableViewCell(label: String, showDisclosure: Bool, tintColor: UIColor?, isSelected: Bool, tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CheckmarkTableViewCell.identifier, for: indexPath) as? CheckmarkTableViewCell
        else { fatalError(#function) }
        cell.configure(label: label, showDisclosure: showDisclosure, tintColor: tintColor, isSelected: isSelected)
        return cell
    }
    func updateCheckmarkTableViewCell(cell: CheckmarkTableViewCell, isSelected: Bool) {
        cell.configureFor(isSelected: isSelected)
    }
}

public final class CheckmarkTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var strikethroughView: UIView!
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
    }
    
    fileprivate func configure(label: String, showDisclosure: Bool, tintColor: UIColor?, isSelected: Bool) {
        configureFor(isSelected: isSelected)
        self.label.text = label
        setAccessoryType(with: showDisclosure)
        iconImageView.tintColor = tintColor ?? .label
    }
    
    func configureFor(isSelected: Bool) {
        super.setSelected(isSelected, animated: true)
        iconImageView.image = isSelected ? Icons.checkmark.image : Icons.dot.image
        strikethroughView.isHidden = !isSelected
    }
    
}
