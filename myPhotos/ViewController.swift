//
//  ViewController.swift
//  myPhotos
//
//  Created by student1 on 3/7/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    var picker = UIImagePickerController()
    var photos = [UIImage]()
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.picker.delegate = self
        self.picker.allowsEditing = true
        NSTimer.scheduledTimerWithTimeInterval(5.0, target: self, selector: "animateImage", userInfo: nil, repeats: true)
    }
    
    @IBAction func addImageOnTap(sender: UIBarButtonItem) {
        let sheet = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
        sheet.popoverPresentationController?.sourceView = self.view
        sheet.popoverPresentationController?.sourceRect = CGRect(x: 0, y: self.view.frame.height, width: self.view.frame.width, height: 100)
        let libraryButton = UIAlertAction(title: "PHOTO LIBRARY", style: .Default) { (action) -> Void in
            self.picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            self.presentViewController(self.picker, animated: true, completion: nil)
        }
        sheet.addAction(libraryButton)
        let cameraButton = UIAlertAction(title: "CAMERA", style: .Default) { (action) -> Void in
            self.picker.sourceType = UIImagePickerControllerSourceType.Camera
            self.presentViewController(self.picker, animated: true, completion: nil)
        }
        sheet.addAction(cameraButton)
        
        presentViewController(sheet, animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.picker.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func  imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]){
        picker.dismissViewControllerAnimated(true) { () -> Void in
            self.photos.append(info[UIImagePickerControllerEditedImage] as! UIImage)
        }
        
    }
    func animateImage()
    {
        if self.photos.count > 0{
            if self.count < self.photos.count - 1 && self.photos.count != 1 {
                self.count++
            } else {
            
                self.count = 0
            }
                UIView.animateWithDuration(1.0, delay: 0.0, options: .CurveEaseIn, animations: { () -> Void in
                    self.imageView.alpha = 0.0
                    }, completion: { (finished) -> Void in
                        if finished {
                            self.imageView.image = self.photos [self.count]
                            UIView.animateWithDuration(1.0, delay: 0.0, options: .CurveEaseOut, animations: { () -> Void in
                                self.imageView.alpha = 1.0
                                }, completion: { (finished) -> Void in
                            })
                        }
                        
                })
            }
        }
        
        
}
