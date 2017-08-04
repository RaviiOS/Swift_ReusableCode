
import Foundation
import UIKit
public extension UITableView {

    func setFooterWithSpacing(_ view: UIView) {

        guard self.numberOfSections > 0 else {
            self.tableFooterView = view
            return
        }

        guard let cell = self.cellForRow(at: IndexPath(row: self.numberOfRows(inSection: self.numberOfSections - 1) - 1,
            section: self.numberOfSections - 1)) else {
                self.tableFooterView = view
                return
        }

        let cellY = cell.frame.origin.y
        let footerContainerY = cellY + cell.frame.height
        let footerContainerHeight = UIScreen.main.bounds.height - footerContainerY

        if footerContainerHeight > 0 {
            let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: footerContainerHeight)
            let footerContainerView = UIView(frame: frame)
            footerContainerView.backgroundColor = .clear
            let viewY = footerContainerHeight - view.frame.height
            view.frame.origin.y = viewY
            view.frame.origin.x = 0
            footerContainerView.addSubview(view)
            self.tableFooterView = footerContainerView
        } else {
            self.tableFooterView = view
        }
    }

    func reloadDataAnimated(_ duration: TimeInterval = 0.4, completion: (() -> Void)?) {
        UIView.transition(
            with: self,
            duration: duration,
            options: .transitionCrossDissolve,
            animations: { [weak self] _ in
                self?.reloadData()
            },
            completion: { _ in completion?() })
    }

}
