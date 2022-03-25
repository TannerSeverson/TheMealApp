//
//  MealsTableViewCell.swift
//  TheMealApp
//
//  Created by Tanner Severson on 3/17/22.
//

import UIKit

public protocol MealsTableViewCellProtocol {
    func registerMealsTableViewCell(for tableView: UITableView)
}


public extension MealsTableViewCellProtocol {
    func registerMealsTableViewCell(for tableView: UITableView) {
        tableView.register(UINib(nibName: MealsTableViewCell.identifier, bundle: .main), forCellReuseIdentifier: MealsTableViewCell.identifier)
    }
    func configureMealsTableViewCell(label: String, loadingState: AsynchronousImageLoadingState, tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MealsTableViewCell.identifier, for: indexPath) as? MealsTableViewCell
        else { fatalError(#function) }
        cell.configure(label: label, loadingState: loadingState)
        return cell
    }
    func updateLoadingState(cell: MealsTableViewCell, loadingState: AsynchronousImageLoadingState) {
        cell.loadingState = loadingState
    }
}

public final class MealsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    
    var loadingState: AsynchronousImageLoadingState = .notLoading {
        didSet {
            switch loadingState {
                case .notLoading:
                    thumbnailImageView.alpha = 0.1
                    activityIndicator.stopAnimating()
                case .loading:
                    thumbnailImageView.image = nil
                    thumbnailImageView.alpha = 0.1
                    activityIndicator.startAnimating()
                case let .loaded(image):
                    thumbnailImageView.alpha = 1
                    thumbnailImageView.image = image
                    activityIndicator.stopAnimating()
                case .error:
                    thumbnailImageView.alpha = 1
                    thumbnailImageView.image = Icons.imageSlash.image
                    activityIndicator.stopAnimating()
            }
        }
    }
    
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
        thumbnailImageView.layer.cornerRadius = 5
    }
    
    fileprivate func configure(label: String, loadingState: AsynchronousImageLoadingState) {
        setAccessoryType(with: true)
        self.label.text = label
        self.loadingState = loadingState
    }
    
}
