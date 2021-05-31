
import UIKit

enum NewsItem {
    case NewsCollectionCell(UIImage, String)
}
class NewsCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var newsArray: [NewsItem] = [.NewsCollectionCell(UIImage(named: "nature")!, " Tree Feast" ), .NewsCollectionCell(UIImage(named:"trash")!, " Clean-up campaign"), .NewsCollectionCell(UIImage(named:"bike")!, "Cycling")]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        self.collectionView?.collectionViewLayout = layout
        layout.scrollDirection = .horizontal
       
    }
}

//MARK: UICollectionViewDataSource
extension NewsCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellType = newsArray[indexPath.row]
        switch  cellType {
    
        case.NewsCollectionCell(let image, let title):
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "newsCollectionCell", for: indexPath) as! NewsCollectionCell
            cell.picture?.image = image
            cell.label?.text = title
            return cell
    }
  }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170, height: 170)
    }
}

//MARK: UICollectionViewDelegateFlowLayout
extension NewsCell: UICollectionViewDelegateFlowLayout {

    
}
