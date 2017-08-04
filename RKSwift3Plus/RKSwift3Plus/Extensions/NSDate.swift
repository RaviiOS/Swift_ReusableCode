

import Foundation

public extension Date {

    /// returns if a date is over 18 years ago
    func isOver18Years() -> Bool {
        var comp = (Calendar.current as NSCalendar).components(NSCalendar.Unit.month.union(.day).union(.year), from: Date())
        guard comp.year != nil && comp.day != nil else { return false }

        comp.year! -= 18
        comp.day! += 1
        if let date = Calendar.current.date(from: comp) {
            if self.compare(date) != ComparisonResult.orderedAscending {
                return false
            }
        }
        return true
    }

    /// returns the month of a date in `MMMM` format
    func monthName() -> String {
        return Constants.Formatters.monthDateFormatter.string(from: self)
    }

    /// returns the year of a date in `yyyy` format
    func year() -> String {
        return Constants.Formatters.yearDateFormatter.string(from: self)
    }

    /// returns the day of a date in `dd` format
    func day() -> String {
        return Constants.Formatters.dayDateFormatter.string(from: self)
    }

}
