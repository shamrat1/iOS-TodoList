//
//  OnboardingViewController.swift
//  onboarding
//
//  Created by Mac on 2/6/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController, OnboardingPageViewDelegate {

    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var nextButton: UIButton!{
        didSet{
            nextButton.layer.cornerRadius = 25.0
            nextButton.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var skipButton: UIButton!
    
    var pageController : OnboardingPageViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    func didUpdateIndex(currentIndex: Int) {
        
        updateUI()
    }
    @IBAction func nextPage(_ sender: UIButton) {
        if let index = pageController?.currentIndex{
            print("Next clicked for \(index)")
            switch index{
            case 0...2:
                pageController?.forwardPage()
            case 3:
                let delegate = UIApplication.shared.delegate as! AppDelegate
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "main")
                delegate.window?.rootViewController = vc
                delegate.window?.makeKeyAndVisible()
            default:break
            }
        }
        updateUI()
    }
    
    @IBAction func skip(_ sender: UIButton) {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "main")
        delegate.window?.rootViewController = vc
        delegate.window?.makeKeyAndVisible()
    }
    func updateUI(){
        if let index = pageController?.currentIndex{
            switch index{
            case 0...2:
                nextButton.setTitle("NEXT", for: .normal)
                skipButton.isHidden = false
            case 3:
                nextButton.setTitle("Start", for: .normal)
                skipButton.isHidden = true
            default:break
            }
            pageControl.currentPage = index
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        
        if let controller = destination as? OnboardingPageViewController {
            pageController = controller
            pageController?.onboardingPageViewDelegate = self
        }
    }

}
