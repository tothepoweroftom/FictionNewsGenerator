//
//  ModelSelectViewController.swift
//  FictionGenerator
//
//  Created by Tom Power on 02/08/2017.
//  Copyright © 2017 MOBGEN:Lab. All rights reserved.
//

import UIKit
import Dropper

class ModelSelectViewController: UIViewController {
    let modelDropper = Dropper(width: 100.0, height: 200.0)
    var model = FictionGenerator.sharedInstance

    
    
    @IBOutlet weak var modelButton: UIButton!
    @IBOutlet weak var newsButton: UIButton!
    @IBOutlet weak var modelArrow: UIImageView!
    @IBOutlet weak var newsArrow: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        modelDropper.delegate = self // Insert this before you show your Dropper
        modelDropper.items = ["SHELLEY", "VERNE", "WELLS", "HUXLEY"]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func modelDropdownSelected(_ sender: UIButton) {
        if modelDropper.status == .hidden {
            modelDropper.items = ["WELLS", "SHELLEY", "VERNE", "HUXLEY"] // Item displayed
            modelDropper.theme = Dropper.Themes.white
            modelDropper.tag = 0

            modelDropper.cornerRadius = 3
            modelDropper.showWithAnimation(0.15, options: Dropper.Alignment.center, button: modelButton)
            UIImageView.animate(withDuration: 0.25, animations: {
                self.modelArrow.transform = CGAffineTransform(rotationAngle: CGFloat.pi*0.5)
            })
            
        } else {
            modelDropper.hideWithAnimation(0.1)
            UIImageView.animate(withDuration: 0.25, animations: {
                self.modelArrow.transform = CGAffineTransform(rotationAngle: 0)
            })
        }
    }
    
    @IBAction func newsDropdownSelected(_ sender: UIButton) {
        
        if modelDropper.status == .hidden {
            modelDropper.items =  ["BBC", "CNN", "NY TIMES"] // Item displayed
            modelDropper.tag = 1
            modelDropper.theme = Dropper.Themes.white
            modelDropper.cornerRadius = 3
            modelDropper.showWithAnimation(0.15, options: Dropper.Alignment.center, button: newsButton)
            UIImageView.animate(withDuration: 0.25, animations: {
                self.newsArrow.transform = CGAffineTransform(rotationAngle: CGFloat.pi*0.5)
            })
        } else {
            modelDropper.hideWithAnimation(0.1)
            UIImageView.animate(withDuration: 0.25, animations: {
                self.newsArrow.transform = CGAffineTransform(rotationAngle: 0)
        })
        }
    }
    
    
    @IBAction func generateText(_ sender: UIButton) {
        print(model.generateText())
        
    }
    
}


extension ModelSelectViewController: DropperDelegate {
    func DropperSelectedRow(_ path: IndexPath, contents: String, tag: Int) {
        
        if (tag == 0){
            modelButton.setTitle(contents, for: .normal)
            model.setFictionModel(model: contents)
            UIImageView.animate(withDuration: 0.25, animations: {
                self.modelArrow.transform = CGAffineTransform(rotationAngle: 0)
            })
        } else if (tag == 1) {
            newsButton.setTitle(contents, for: .normal)
            model.setNewsModel(model: contents)
            UIImageView.animate(withDuration: 0.25, animations: {
                self.newsArrow.transform = CGAffineTransform(rotationAngle: 0)
            })

        }
    }
}
