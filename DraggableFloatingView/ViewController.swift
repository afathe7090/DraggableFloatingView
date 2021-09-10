//
//  ViewController.swift
//  DraggableFloatingView
//
//  Created by Ahmed Fathy on 10/09/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var draggedView: UIView!{didSet{draggedView.layer.cornerRadius = 35}}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        draggedView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handelDragged)))
    }


    
    @objc func handelDragged(gesture: UIPanGestureRecognizer){
        
        //=====>> take the location of (x,y) in the view
        let location = gesture.location(in: view)
        //=====>> the take instance from owner View that access to this gesture to update the location of it
        let draggedView = gesture.view
        //=====>> make the draggedView center in the location of panGestureRecoganizer
        draggedView?.center = location
        
        if gesture.state == .ended {
            //=====>> the dragged View here have the Value of the gisture so it always changed so we check===> the frame.midX the mean >= view.frame.width/2 ===> to check if the view in center view ,after or View to make tha animation of new place of the view
            if self.draggedView.frame.midX >= self.view.frame.width / 2{
                UIView.animate(withDuration: 0.5) {
                    
                    //=====>> Here if set center x of view and get the value of center (x) by width of the view===> - the value the have the width of dragged view / 2 + the space want to leave from leading
                    self.draggedView.center.x = self.view.layer.frame.width - 50
                }
            }else{
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn) {
                    
                    //=====>> the we set the center of x
                    //=====>> Note: The center.x of any View it is Mean that the self of width/2 + the space want to leave from the leading or tralling traling
                    self.draggedView.center.x = 50
                }
            }
        }
        
    }
    
}

