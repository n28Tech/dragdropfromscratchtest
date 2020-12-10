//
//  ViewController.swift
//  dragdropfromscratchtest
//
//  Created by Kevin Campbell on 12/7/20.
//

import UIKit
import DragDropiOS

class ViewController: UIViewController {
    
    //@IBOutlet weak var Tableview: UITableView!
    
    @IBOutlet weak var dragDropTableView: DragDropTableView!
    
    
    @IBOutlet weak var dragDropView: DragDropView!
    
    var tableFruit = [Model]()
    var dragDropManager:DragDropManager!
    let labels = ["StackOverFlow" , "Udemy", "GitHUb", "FireBase", "CocoPods"]

    override func viewDidLoad() {
        super.viewDidLoad()
        dragDropTableView.dragDropDelegate = self
        //Tableview.delegate = self
        //Tableview.dataSource = self
        dragDropManager = DragDropManager(canvas: self.view, views: [dragDropView,dragDropTableView])
        
        popFruitTable()
    }
    func popFruitTable(){
       
        var ind = 0

        for label in labels {
               
            let modelFruit = Model()
            modelFruit.tableIndex = ind
            
            let labelF = UILabel(frame: CGRect(x:10, y:200, width: 100, height: 25))
            labelF.text = label
            labelF.layer.cornerRadius = 20
            labelF.layer.masksToBounds = true
            
            labelF.backgroundColor = UIColor.red.withAlphaComponent(0.2)
            labelF.textColor = .blue
            labelF.textAlignment = .center
            labelF.font = UIFont.boldSystemFont(ofSize: 12)
           
            UIGraphicsBeginImageContextWithOptions(labelF.bounds.size, false, 0)
            labelF.drawHierarchy(in: labelF.bounds, afterScreenUpdates: true)
            var image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            let size = CGSize(width: 100, height: 25)
            image = imageResize(image: image!, sizeChange: size)
            let imageView = UIImageView(image: image!)
            let fruit = Fruit(id: ind, name: label, imageName: image!)
            modelFruit.fruit = fruit
            tableFruit.insert(modelFruit, at: ind)
           
            ind += 1
        }
       
        
        
    }
    
    func imageResize (image:UIImage, sizeChange:CGSize)-> UIImage{

            let hasAlpha = true
            let scale: CGFloat = 0.0 // Use scale factor of main screen

            // Create a Drawing Environment (which will render to a bitmap image, later)
            UIGraphicsBeginImageContextWithOptions(sizeChange, !hasAlpha, scale)

        image.draw(in: CGRect(origin: CGPoint.zero, size: sizeChange))

            let scaledImage = UIGraphicsGetImageFromCurrentImageContext()

            // Clean up the Drawing Environment (created above)
            UIGraphicsEndImageContext()

        return scaledImage!
        }
    
    
    
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableFruit.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = tableFruit[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellName, for: indexPath) as! DragDropTableViewCell
        
        
        cell.updateData(model)
        
        return cell
    }
    
    
    
    
}

