

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    @IBOutlet var table:UITableView?
    @IBOutlet var profimagebtn:UIButton?
    var data:Array<AnyObject>?;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profimagebtn?.layer.cornerRadius = (profimagebtn?.frame.height)! / 2.0
        data = Array<AnyObject>();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        self.table?.reloadData()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cellidentifier")!
        let imgview :UIImageView = (cell.viewWithTag(1) as? UIImageView)!
//        imgview.image =   UIImage(named: "p.jpg")
        imgview.image = (self.data?[indexPath.row])! as? UIImage
        return cell
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return data!.count
      
    }
    @IBAction func addBtnDidPressed(sender:UIButton)
    {
        
        data!.append((profimagebtn?.backgroundImageForState(UIControlState.Normal))!);
        self.table?.reloadData()
    }
    
    @IBAction func profileImageBtnDidPressed(sender:UIButton)
    {
        let picker: UIImagePickerController? = UIImagePickerController()
        picker?.delegate = self;
        picker?.allowsEditing = true;
        picker?.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        NSOperationQueue.mainQueue().addOperationWithBlock { () -> Void in
            self.presentViewController(picker!, animated: true, completion: nil)
        }
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let img :UIImage =  (info[UIImagePickerControllerEditedImage])! as! UIImage
       
        self.profimagebtn?.setBackgroundImage(img, forState: UIControlState.Normal)
         picker.dismissViewControllerAnimated(true, completion: nil)
    }
}

