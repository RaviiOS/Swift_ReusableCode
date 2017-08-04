
import Foundation
import UIKit
public struct Constants {

    public struct Formatters {

        static let monthDateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "MMMM"

            return formatter
        }()

        static let yearDateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy"

            return formatter
        }()

        static let dayDateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd"

            return formatter
        }()

        static let currencyFormatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            return formatter
        }()

        static let currencyFormatterWithoutComma: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = NumberFormatter.Style.currency
            formatter.maximumFractionDigits = 0
            return formatter
        }()

    }
    
    /// MARK: - URLConstants.swift
    struct APPURL {
        
        private struct Domains {
            static let Dev = "http://test-dev.cloudapp.net"
            static let UAT = "http://test-UAT.com"
            static let Local = "192.145.1.1"
            static let QA = "testAddress.qa.com"
        }
        
        private  struct Routes {
            static let Api = "/api/mobile"
        }
        
        private  static let Domain = Domains.Dev
        private  static let Route = Routes.Api
        private  static let BaseURL = Domain + Route
        
        static var FacebookLogin: String {
            return BaseURL  + "/auth/facebook"
        }
    }
    
    struct CellIdentifiers {
        static let HomeSplitCell = "homeSplitCell"
        static let DetailsCell = "detailsCell"
    }
    //FontsConstants.swift
    struct FontNames {
        
        static let PalatinoName = "Palatino"
        struct Palatino {
            static let PalatinoBold = "Palatino-Bold"
            static let PalatinoMedium = "Palatino-Medium"
            static let Palatino = "Palatino"
        }
    }
    //KeyConstants.swift
    struct Key {
        
        //        static let DeviceType = "iOS"
        struct UserKeys {
            static let Language_key = "Language_key"
            static let Technical = "Technical Services"
            static let Water = "Water Services"
            static let Health = "Health Services"
            static let LoginKey = "LoginKey"
        }
        struct Beacon{
            static let ONEXUUID = "xxxx-xxxx-xxxx-xxxx"
        }
        
        struct UserDefaults {
            static let k_App_Running_FirstTime = "userRunningAppFirstTime"
        }
        
        struct Headers {
            static let Authorization = "Authorization"
            static let ContentType = "Content-Type"
        }
        struct Google{
            static let placesKey = "some key here"//for photos
            static let serverKey = "some key here"
        }
        
        struct ErrorMessage{
            static let listNotFound = "ERROR_LIST_NOT_FOUND"
            static let validationError = "ERROR_VALIDATION"
        }
    }
    //ColorConstants.swift
    struct AppColor {
        
        private struct Alphas {
            static let Opaque = CGFloat(1)
            static let SemiOpaque = CGFloat(0.8)
            static let SemiTransparent = CGFloat(0.5)
            static let Transparent = CGFloat(0.3)
        }
        
        static let appPrimaryColor =  UIColor.white.withAlphaComponent(Alphas.SemiOpaque)
        static let appSecondaryColor =  UIColor.blue.withAlphaComponent(Alphas.Opaque)
        
        struct TextColors {
            static let Error = AppColor.appSecondaryColor
            static let Success = UIColor(red: 0.1303, green: 0.9915, blue: 0.0233, alpha: Alphas.Opaque)
        }
        
        struct TabBarColors{
            static let Selected = UIColor.white
            static let NotSelected = UIColor.black
        }
        
        struct OverlayColor {
            static let SemiTransparentBlack = UIColor.black.withAlphaComponent(Alphas.Transparent)
            static let SemiOpaque = UIColor.black.withAlphaComponent(Alphas.SemiOpaque)
            static let demoOverlay = UIColor.black.withAlphaComponent(0.6)
        }
    }
    //FontSizesConstants.swift
    struct FontSizes {
        static let Large: CGFloat = 14.0
        static let Small: CGFloat = 10.0
    }
    //AnimationDurationConstants.swift
    struct AnimationDurations {
        static let Fast: TimeInterval = 1.0
        static let Medium: TimeInterval = 3.0
        static let Slow: TimeInterval = 5.0
    }
    //EmojisConstants.swift
    struct Emojis {
        static let Happy = "😄"
        static let Sad = "😢"
    }
    //Segue Identifiers Constants.swift
    struct StoryBoardIdentifiers {
//        static let Base = "CSBaseViewController"
        static let Login = "Login"
        static let RootTabBar = "RootTabbar"
    }
  

}
