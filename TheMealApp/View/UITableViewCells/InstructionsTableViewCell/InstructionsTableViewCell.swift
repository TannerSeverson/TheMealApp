//
//  InstructionsTableViewCell.swift
//  TheMealApp
//
//  Created by Tanner Severson on 3/17/22.
//

import UIKit

public protocol InstructionsTableViewCellProtocol {
    func registerInstructionsTableViewCell(for tableView: UITableView)
}


public extension InstructionsTableViewCellProtocol {
    func registerInstructionsTableViewCell(for tableView: UITableView) {
        tableView.register(UINib(nibName: InstructionsTableViewCell.identifier, bundle: .main), forCellReuseIdentifier: InstructionsTableViewCell.identifier)
    }
    func configureInstructionsTableViewCell(label: String, tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: InstructionsTableViewCell.identifier, for: indexPath) as? InstructionsTableViewCell
        else { fatalError(#function) }
        cell.configure(label: label)
        return cell
    }
}

final class InstructionsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
        self.selectionStyle = .none
    }
    
    fileprivate func configure(label: String) {
        self.label.text = label
    }
    
}
