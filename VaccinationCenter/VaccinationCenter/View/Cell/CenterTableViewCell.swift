import UIKit

class CenterTableViewCell: UITableViewCell {

    @IBOutlet weak var centerName: UILabel!
    @IBOutlet weak var facilityName: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var updateAt: UILabel!
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
      String(describing: self)
    }
    
    func configureCell(center: Center) {
        self.centerName.text = center.centerName
        self.facilityName.text = center.facilityName
        self.address.text = center.address
        self.updateAt.text = center.updatedAt
    }
    
}
