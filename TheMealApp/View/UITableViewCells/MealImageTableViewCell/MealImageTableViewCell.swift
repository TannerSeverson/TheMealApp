//
//  MealImageTableViewCell.swift
//  TheMealApp
//
//  Created by Tanner Severson on 3/16/22.
//

import UIKit

public protocol MealImageTableViewCellProtocol {
    func registerMealImageTableViewCell(for tableView: UITableView)
}
public extension MealImageTableViewCellProtocol {
    func registerMealImageTableViewCell(for tableView: UITableView) {
        tableView.register(UINib(nibName: MealImageTableViewCell.identifier, bundle: .main), forCellReuseIdentifier: MealImageTableViewCell.identifier)
    }
    func configureMealImageTableViewCell(loadingState: AsynchronousImageLoadingState, tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MealImageTableViewCell.identifier, for: indexPath) as? MealImageTableViewCell
        else { fatalError(#function) }
        cell.configure(loadingState: loadingState)
        return cell
    }
    func updateLoadingState(cell: MealImageTableViewCell, loadingState: AsynchronousImageLoadingState) {
        cell.loadingState = loadingState
    }
}

public final class MealImageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    var loadingState: AsynchronousImageLoadingState = .notLoading {
        didSet {
            switch loadingState {
                case .notLoading:
                    mealImageView.alpha = 0.1
                    activityIndicator.stopAnimating()
                case .loading:
                    mealImageView.alpha = 0.1
                    activityIndicator.startAnimating()
                case let .loaded(image):
                    mealImageView.alpha = 1
                    mealImageView.image = image
                    activityIndicator.stopAnimating()
                case .error:
                    mealImageView.alpha = 1
                    mealImageView.image = Icons.imageSlash.image
                    activityIndicator.stopAnimating()
            }
        }
    }
    
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
        self.selectionStyle = .none
        
        mealImageView.image = UIImage(named: Icons.bacon.rawValue)
        mealImageView.layer.cornerRadius = 5
        
        NSLayoutConstraint.activate([
            mealImageView.centerXAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerXAnchor),
            mealImageView.centerYAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerYAnchor),
            mealImageView.heightAnchor.constraint(equalTo: mealImageView.widthAnchor, constant: 0),
            mealImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 0),
            mealImageView.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor, constant: 0),
            mealImageView.rightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor, constant: 0),
            mealImageView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: 0),
        ])
        
        activityIndicator.center = self.mealImageView.center
    }
    
    fileprivate func configure(loadingState: AsynchronousImageLoadingState) {
        self.loadingState = loadingState
    }
    
}
