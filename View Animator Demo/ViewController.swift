//
//  ViewController.swift
//  View Animator Demo
//
//  Created by Eric Crichlow on 3/16/20.
//  Copyright © 2020 Infusions of Grandeur. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

	@IBOutlet weak var imageViewAlpha: UIImageView!
	@IBOutlet weak var imageViewBeta: UIImageView!

	static let fadeTime = 5.0

	var alphaFadeInAnimator: UIViewPropertyAnimator?
	var betaFadeInAnimator: UIViewPropertyAnimator?

	override func viewDidLoad()
	{
		super.viewDidLoad()
		startAnimations()
	}

	private func startAnimations()
	{
		imageViewAlpha.alpha = 0.0
		imageViewBeta.alpha = 1.0
		alphaFadeInAnimator = UIViewPropertyAnimator(duration: ViewController.fadeTime, curve: .linear)
		{
			self.imageViewAlpha.alpha = 1.0
			self.imageViewBeta.alpha = 0.0
		}
		betaFadeInAnimator = UIViewPropertyAnimator(duration: ViewController.fadeTime, curve: .linear)
		{
			self.imageViewAlpha.alpha = 0.0
			self.imageViewBeta.alpha = 1.0
		}
		if let alphaAnimator = self.alphaFadeInAnimator, let betaAnimator = self.betaFadeInAnimator
		{
			alphaAnimator.addCompletion
			{
				position in
				betaAnimator.startAnimation()
			}
			betaAnimator.addCompletion
			{
				position in
				self.startAnimations()
			}
			alphaFadeInAnimator!.startAnimation()
		}
	}
}

