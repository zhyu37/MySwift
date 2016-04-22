
import Foundation

let d = NSData()

do {
    try d.writeToFile("Hello", options: [])
} catch let error as NSError {
    print ("Error: \(error.domain)")
}

enum LoginError: ErrorType {
    case UserNotFound, UserPasswordNotMatch
}

func login(user: String, password: String) throws {
    let users = [String: String]()

    if !users.keys.contains(user) {
        throw LoginError.UserNotFound
    }
    
    if users[user] != password {
        throw LoginError.UserPasswordNotMatch
    }
    
    print("Login successfully.")
}

do {
    try login("onevcat", password: "123")
} catch LoginError.UserNotFound {
    print("UserNotFound")
} catch LoginError.UserPasswordNotMatch {
    print("UserPasswordNotMatch")
}

// Do something with login user