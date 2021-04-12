
import UIKit

class ReportStep2ViewController: UIViewController, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
   let categoryArray: [categories] = [
    categories (name: "Roadway",icon: "road"),
    categories (name: "Garbage/ Trash",icon: "dropbox"),
    categories (name: "Public lighting",icon: "lightbulb"),
    categories (name: "Cleanliness",icon: "trash"),
    categories (name: "Vehicles/ Parking",icon: "car"),
    categories (name: "Green space",icon: "road"),
    categories (name: "More",icon: "questionmark.circle")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cel = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? Step2CollectionViewCell {
            cel.backgroundColor = UIColor.systemBlue
            cel.label?.text = String(indexPath.item)
            
            return cel
        }
        return UICollectionViewCell()
    }

}
