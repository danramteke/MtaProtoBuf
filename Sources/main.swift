import Dispatch
import Foundation

print("Hello, world!")


class Mainer {
  let semaphore = DispatchGroup()
  
  func go() {
    DispatchQueue.global().async { 
      let url = URL(string: "https://itunes.apple.com/search?media=music&entity=song&term=lamar")!
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


let mainer = Mainer()
mainer.go()


