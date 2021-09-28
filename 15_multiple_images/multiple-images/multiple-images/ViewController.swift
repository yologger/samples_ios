import TLPhotoPicker
import ImageSlideshow
import Alamofire

import UIKit

class ViewController: UIViewController {
    
    @IBAction func openAlbum(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let imageSliderViewController = storyBoard.instantiateViewController(withIdentifier: "AlbumViewController")
        self.navigationController?.pushViewController(imageSliderViewController, animated: true)
    }
    
    @IBAction func openImageSlider(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let imageSliderViewController = storyBoard.instantiateViewController(withIdentifier: "ImageSliderViewController")
        self.navigationController?.pushViewController(imageSliderViewController, animated: true)
    }
    
    @IBAction func openUpload(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let imageSliderViewController = storyBoard.instantiateViewController(withIdentifier: "UploadViewController")
        self.navigationController?.pushViewController(imageSliderViewController, animated: true)
    }
}
