import UIKit
import TLPhotoPicker

class AlbumViewController: UIViewController {
    
    var selectedAssets = [TLPHAsset]()
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func openAlbum(_ sender: Any) {
        let photosPickerViewController = TLPhotosPickerViewController()
        photosPickerViewController.delegate = self
        // let configure = TLPhotosPickerConfigure()
        //configure.nibSet = (nibName: "CustomCell_Instagram", bundle: Bundle.main) // If you want use your custom cell..
        self.present(photosPickerViewController, animated: true, completion: nil)
    }
}

extension AlbumViewController {
    override func viewDidLoad() {
        
    }
}

extension AlbumViewController: TLPhotosPickerViewControllerDelegate {
    
    func shouldDismissPhotoPicker(withTLPHAssets: [TLPHAsset]) -> Bool {
        print("shouldDismissPhotoPicker")
        self.selectedAssets = withTLPHAssets
        print(withTLPHAssets)
        self.imageView.image = selectedAssets[0].fullResolutionImage
        return true
    }
    
    func photoPickerDidCancel() {
        print("cancel")
    }
    
    func handleNoAlbumPermissions(picker: TLPhotosPickerViewController) {
        print("handle no album permission")
    }
    
    func handleNoCameraPermissions(picker: TLPhotosPickerViewController) {
        print("handle no camera permission")
    }
}
