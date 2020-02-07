//
//  OnboardingContentViewController.swift
//  onboarding
//
//  Created by Mac on 2/6/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class OnboardingContentViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var subHeadingLabel: UILabel!
    
    var index  = 0
    var image = ""
    var heading = ""
    var subHeading = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageView.image = UIImage(named: image)
        headingLabel.text = heading
        subHeadingLabel.text = subHeading
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
