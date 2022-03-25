//
//  AsynchronousImageLoadingState.swift
//  TheMealApp
//
//  Created by Tanner Severson on 3/19/22.
//

import UIKit

/**
 `AsynchronousImageLoadingState` is an `enum` used to handle each condition during the progress of asynchronous image loading.
 */
public enum AsynchronousImageLoadingState {
    case notLoading
    case loading
    case loaded(UIImage)
    case error
}
