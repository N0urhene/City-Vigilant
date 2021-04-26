
import UIKit

enum CategoryCell {
    case CategoriesCell(UIImage, String)
}
class ReportCategoriesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var categoryArray: [CategoryCell] = [.CategoriesCell(UIImage(systemName: "map")!, "Roadway"), .CategoriesCell(UIImage(systemName: "xmark.bin")!, "Garbage/ Trash"), .CategoriesCell(UIImage(systemName: "lightbulb")!, "Public lighting"), .CategoriesCell(UIImage(systemName: "trash")!, "Cleanliness"), .CategoriesCell(UIImage(systemName: "car")!, "Vehicles/ Parking"),   .CategoriesCell(UIImage(systemName: "leaf")!, "Green space"), .CategoriesCell(UIImage(systemName: "questionmark.circle")!, "More")]
    let spacing:CGFloat = 16.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        self.collectionView?.collectionViewLayout = layout
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfItemsPerRow:CGFloat = 2
        let spacingBetweenCells:CGFloat = 16
        
        let totalSpacing = (2 * self.spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells)
        
        if let collection = self.collectionView{
            let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
            return CGSize(width: width, height: width)
        }else{
            return CGSize(width: 0, height: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellType = categoryArray[indexPath.row]
        switch  cellType {
        
        case .CategoriesCell(let icon, let value):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCell", for: indexPath) as! CategoriesCell
            cell.iconImage?.image = icon
            cell.label?.text = value
            return cell
            
        default:
            break
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ReportViewController") as? ReportViewController {
            
            self.navigationController?.pushViewController(view, animated: true)
        }
    }
}
