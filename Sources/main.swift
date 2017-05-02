import Dispatch
import Foundation
import SwiftProtobuf



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
            print("**got a 200**")
            for (key, value) in httpResponse.allHeaderFields {
              print("*\(key): \(value)")
            }
            do {
            
              let feed = try TransitRealtime_FeedMessage(serializedData: data)
              //let stream = CodedInputStream(data: data)
              //let builder = try TransitRealtime.FeedMessage.Builder().mergeFrom(codedInputStream: stream)
              //let feed = try builder.build() //whole feed
              
              
              
              for entity in feed.entity { //entities in the feed that are not the header
                print("*", entity.tripUpdate)
              }

            } catch {
              print(error)
            }
            
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


