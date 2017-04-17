import Dispatch
import Foundation

print("Hello, world!")
extension Array {
    subscript (safe index: Int) -> Element? {
        return index >= 0 && index < self.count
            ? self[index]
            : nil
    }
}


class Mainer {
  let semaphore = DispatchGroup()
  
  func go(mtaKey: String) {
    DispatchQueue.global().async { 
      let url = URL(string: "http://datamine.mta.info/mta_esi.php?key=\(mtaKey)&feed_id=1")!
      let defaultSession = URLSession(configuration: URLSessionConfiguration.default)
      let dataTask = defaultSession.dataTask(with: url) { data, response, error in

        if let error = error {
          print(error.localizedDescription)
        } else if let httpResponse = response as? HTTPURLResponse, let data = data {
          if httpResponse.statusCode == 200 {
            print("got a 200")
            print(String(data: data, encoding: String.Encoding.utf8) ?? "couldnt make string from HTTP response")
            self.semaphore.leave()
          }
        }
      }
      dataTask.resume()
    }

    self.semaphore.enter()
    self.semaphore.wait()   
  }
}

print(CommandLine.arguments)


if CommandLine.arguments.count == 2 {
  let mtaKey = CommandLine.arguments[1]
  let mainer = Mainer()
  mainer.go(mtaKey: mtaKey)

} else {
  print("usage:\nfirst arg is the mta key")
} 


