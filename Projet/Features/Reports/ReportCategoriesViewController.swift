
import UIKit

enum CategoryCell {
    case CategoriesCell(UIImage, String)
}
class ReportCategoriesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var categorie: String?
    var categoryArray: [CategoryCell] = [.CategoriesCell(UIImage(systemName: "map")!, "Roadway"), .CategoriesCell(UIImage(systemName: "xmark.bin")!, "Garbage/ Trash"), .CategoriesCell(UIImage(systemName: "lightbulb")!, "Public lighting"), .CategoriesCell(UIImage(systemName: "trash")!, "Cleanliness"), .CategoriesCell(UIImage(systemName: "car")!, "Vehicles/ Parking"),   .CategoriesCell(UIImage(systemName: "leaf")!, "Green space"), .CategoriesCell(UIImage(systemName: "questionmark.circle")!, "More")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let spacing:CGFloat = 16
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        self.collectionView?.collectionViewLayout = layout
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacingBetweenCells:CGFloat = 16
        let totalSpacing = (2 * spacingBetweenCells) + spacingBetweenCells
        let width = (collectionView.bounds.width - totalSpacing)/2
        return CGSize(width: width, height: width)
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
            cell.getCategorie = {(value: String?) in
            self.categorie = value
            }
            return cell
            
        default:
            break
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ReportViewController") as? ReportViewController {
            
            navigationController?.pushViewController(view, animated: true)
        }
    }
}
