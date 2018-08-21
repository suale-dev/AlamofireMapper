# Alamofire Mapper
An extension to [Alamofire](https://github.com/Alamofire/Alamofire) which automatically converts JSON response data into swift objects using **Switf 4 Decodeable**

# Features
* Automatically convert JSON to Swift object
* Don't need to map field by field, allow custom field name
* Support object & array & nested object
* Support decode Datetime field with timestamp, iso8601 format
* Easy to use


# Installation
**AlamofireMapper** can be added to your project using Cocoapods by adding the following line to your Podfile:

```
pod 'AlamofireMapper'
```
Note: maybe you need to run ***pod repo update*** before ***pod install***




# Usage
Raw json response from server

```
{
   "page":1,
   "per_page":3,
   "total":12,
   "total_pages":4,
   "data":[
      {
         "id":1,
         "first_name":"George",
         "last_name":"Bluth",
         "avatar":"https://s3.amazonaws.com/uifaces/faces/twitter/calebogden/128.jpg"
      },
      {
         "id":2,
         "first_name":"Janet",
         "last_name":"Weaver",
         "avatar":"https://s3.amazonaws.com/uifaces/faces/twitter/josephstein/128.jpg"
      },
      {
         "id":3,
         "first_name":"Emma",
         "last_name":"Wong",
         "avatar":"https://s3.amazonaws.com/uifaces/faces/twitter/olegpogodaev/128.jpg"
      }
   ]
}

```

Swift class just conform Decodeable

```swift

class UserResponse: Decodable {
    var page: Int!
    var per_page: Int!
    var total: Int!
    var total_pages: Int!
    
    var data: [User]?
}

class User: Decodable {
    var id: Double!
    var first_name: String!
    var last_name: String!
    var avatar: String!
}

```


Then you can use the extension as the follows:

```swift
import Alamofire
import AlamofireMapper

let url1 = "https://raw.githubusercontent.com/sua8051/AlamofireMapper/master/user1.json"
        Alamofire.request(url1, method: .get
            , parameters: nil, encoding: URLEncoding.default, headers: nil).responseObject { (response: DataResponse<UserResponse>) in
                switch response.result {
                case let .success(data):
                    dump(data)
                case let .failure(error):
                    dump(error)
                }
        }
```


Support array response:

```swift
let url3 = "https://raw.githubusercontent.com/sua8051/AlamofireMapper/master/user2.json"
        Alamofire.request(url3, method: .get
            , parameters: nil, encoding: URLEncoding.default, headers: nil).responseObject { (response: DataResponse<[User]>) in
                switch response.result {
                case let .success(data):
                    dump(data)
                case let .failure(error):
                    dump(error)
                }
        }
```

You can custom decode key
```swift
class Movie: Decodable {
    var id: String!
    var name: String!
    var movies: Array<String>!
    var createdAt: Date?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case movies = "movies[]"
        case createdAt
    }
}
```

with json as the follows:

```
{
    "name":"paul rudd",
    "movies[]":[
        "I Love You Man",
        "Role Models"
    ],
    "id":"243",
    "createdAt":"2014-10-18T12:09:05.255Z"
}

```

