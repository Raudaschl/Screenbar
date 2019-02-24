import Foundation

class ScreenShot : NSObject {
    
    lazy var dateFormatter = DateFormatter();
    
    func take() {
        let dateString = self.getDate()
        let task = Process()
        task.launchPath = "/usr/sbin/screencapture"
        var arguments = [String]();
        if(Settings.getPlaySound() == 0) {
            arguments.append("-x")
        }
        
        //        Create directory if needed
        //        let finalPath = Settings.getPath().path + "/hello"
        //
        //        do {
        //            try FileManager.default.createDirectory(atPath:String(describing: finalPath), withIntermediateDirectories: true, attributes: nil)
        //        } catch {
        //            print(error)
        //        }
        
        
        arguments.append(Settings.getPath().path + "/" + dateString + ".png")
        task.arguments = arguments
        task.launch()
    }
    
    private func getDate() -> String {
        let date = Date()
        self.dateFormatter.dateStyle = DateFormatter.Style.short
        self.dateFormatter.timeStyle = DateFormatter.Style.medium
        var dateString = self.dateFormatter.string(from: date)
        
        dateString = dateString.replacingOccurrences(of: ", ", with: "-", options: NSString.CompareOptions.literal, range: nil)
        dateString = dateString.replacingOccurrences(of: "/", with: ".", options: NSString.CompareOptions.literal, range: nil)
        dateString = dateString.replacingOccurrences(of: ":", with: ".", options: NSString.CompareOptions.literal, range: nil)
        return dateString;
    }
}
