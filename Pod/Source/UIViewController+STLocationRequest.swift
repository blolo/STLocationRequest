//
//  UIViewController+STLocationRequest.swift
//  Pods
//
//  Created by Sven Tiigi on 02.12.15.
//
//

import Foundation
import UIKit

public extension UIViewController {
    /*
		UIViewController extension for showing the LocationRequestScreen
	*/
    public func showLocationRequestController(setTitle title: String, setAllowButtonTitle allowButtonTitle: String, setNotNowButtonTitle notNowButtonTitle: String, setMapViewAlphaValue mapViewAlphaValue: CGFloat?, setBackgroundViewColor backgroundViewColor: UIColor?, setDelegate delegate: LocationRequestDelegate?) {
		
		// Create the Bundle Path for Resources
		let bundlePath = NSBundle(forClass: STLocationRequestController.self).pathForResource("STLocationRequest", ofType: "bundle")
		
		// Get the Storyboard File
		let stb = UIStoryboard(name: "StoryboardLocationRequest", bundle:NSBundle(path: bundlePath!))
		
		// Instantiate the ViewController by Identifer as STLocationRequestController
		let locationRequestViewController = stb.instantiateViewControllerWithIdentifier("locationRequestController") as! STLocationRequestController
		
		// Passing the parameters Values to STLocationRequest-Controller
		locationRequestViewController.titleLabelText = title
		locationRequestViewController.allowButtonTitle = allowButtonTitle
		locationRequestViewController.notNowButtonTitle = notNowButtonTitle
		locationRequestViewController.mapViewAlphaValue = mapViewAlphaValue
		locationRequestViewController.backgroundViewColor = backgroundViewColor
        locationRequestViewController.delegate = delegate

		// Present the locationRequestViewController
        self.presentViewController(locationRequestViewController, animated: true) { 
            delegate?.locationRequestControllerPresented()
        }
	}
}