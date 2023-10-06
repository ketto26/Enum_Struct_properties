import Foundation

/*                  -- 1--
 შექმენით enum-ი სახელით DayOfWeek შესაბამისი ქეისებით. დაწერეთ function რომელიც იღებს ამ ენამის ტიპს. function-მა უნდა და-print-ოს, გადაწოდებული დღე კვირის დღეა თუ დასვენების.
 */

enum DayOfWeek {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
    
    func dayCheck() {
        switch self {
        case .saturday, .sunday:
            print("\(self) is a holiday 🎊")
        default:
            print("\(self) is a weekday! 👩🏻‍💻")
        }
    }
}
let today = DayOfWeek.friday
today.dayCheck()
print("\n")







/*                  -- 2 --
 შექმენით enum-ი Weather შემდეგი ქეისებით, Sunny, Cloudy, Rainy და Snowy. ამ ქეისებს უნდა ჰქონდეს associated value Celsius-ის სახით. დაწერეთ function რომელიც მიიღებს ამ enum-ს, და მოგვცემს რეკომენდაციას რა უნდა ჩავიცვათ შესაბამისი ამინდის მიხედვით.
 */
enum Weather {
    case sunny(Double)
    case cloudy(Double)
    case rainy(Double)
    case snowy(Double)
    
    func whatToWear() {
        switch self {
        case .sunny(let temperature):
            if temperature >= 27 {
                print("It's sunny and temperature is \(temperature)˚C. Wear light clothes and avoid the sun!")
            } else {
                print("It's sunny but temperature is low. Don't be fooled. Wear a little bit warm clothes. The temperature is \(temperature)˚C")
            }
        case .cloudy(let temperature):
            print("It's cloudy, wear warm clothes, the temperature is \(temperature)˚C")
        case .rainy(let temperature):
            print("It's rainy today and temperature is \(temperature)˚C. Wear raincoat and don't forget your umbralla.")
        case .snowy(let temperature):
            print("It's snowy outside. Temperature is \(temperature)˚C. Wear warm clothes and have fun ☃️")
        }
    }
}
let weatherNow = Weather.sunny(27.0)
print(weatherNow.whatToWear())
print("\n")








/*                  -- 3 --
 შექმენით struct-ი Book, with properties როგორიცაა: title, author, publicationYear. ამის შემდეგ შექმენით array-ი Book-ის ტიპის, შექმენით რამოდენიმე Book-ის ობიექტი, და შეავსეთ array ამ წიგნებით. დაწერეთ function რომელიც მიიღებს ამ წიგნების array-ს და მიიღებს წელს. function-მა უნდა დაგვიბრუნოს ყველა წიგნი რომელიც გამოშვებულია ამ წლის შემდეგ. დავ-print-ოთ ეს წიგნები.
 */

struct Book {
    var title: String
    var author: String
    var publicationYear: Int
}

var books: [Book] = []

var book1 = Book(title: "Madame Bovary", author: "Gustave Flaubert", publicationYear: 1856)
var book2 = Book(title: "Arch of Triumph", author: "Erich Maria Remarque", publicationYear: 1945)
var book3 = Book(title: "Who Will Cry When You Die", author: "Robin Sharma", publicationYear: 1999)
var book4 = Book(title: "Berserk", author: "Kentaro Miura", publicationYear: 1989)
var book5 = Book(title: "Nineteen Eighty-Four (1984)", author: "George Orwell", publicationYear: 1949)

books = [book1, book2, book3, book4, book5]

func booksPublishedAfter(_ year: Int, from books: [Book]) -> [Book] {
    return books.filter { $0.publicationYear > year }
}

let yearsToCheck = 1945

print("The books published after \(yearsToCheck) are:")

for book in booksPublishedAfter(yearsToCheck, from: books) {
    print("\(book.title) by \(book.author) was published in \(book.publicationYear)")
}
print("\n")







/*                  -- 4 --
 შექმენით struct BankAccount, with properties როგორიცაა: holderName, accountNumber, balance. ამ ობიექტში დაამატეთ methods, დეპოზიტისა და გატანის (withdraw), დაწერეთ შესაბამისი ლოგიკა და ეცადეთ გაითვალისწინოთ სხვადასხვა ეჯ-ქეისები (edge case). მაგ. თანხის გატანისას თუ თანხა იმაზე ნაკლებია ვიდრე გვაქვს, თანხას ვერ გავიტანთ და ასე შემდეგ. print-ის მეშვეობით გამოვიტანოთ შესაბამისი შეცდომები . ამის შემდეგ შექმენით BankAccount ობიექტი და გააკეთეთ ტრანზაქციების იმიტაცია თქვენს მიერ დაწერილი მეთოდებით.
 */
struct BankAccount {
    let holderName: String
    let accountNumber: String
    var balance: Double
    
    mutating func deposit(amount: Double) {
        if amount > 0 {
            balance += amount
            print("\(holderName) deposit amount: \(amount)$. Deposit date: \(Date.now). Current balance: \(balance + amount)$.")
        } else {
            print("Can't make any transaction. Invalid deposit amount.")
        }
    }
    
    mutating func withdraw(amount: Double) {
        if amount > 0 {
            if amount > balance {
                print("Invalid transaction. No enough balamce for withdraw.")
            } else {
                balance -= amount
                print("\(holderName) withdrew \(amount)$. Withdraw date: \(Date.now). Current balance \(balance)")
            }
        }
    }
    
}
var accountZoro = BankAccount(holderName: "Roronoa Zoro", accountNumber: "0PO21111", balance: 20202020)

print("Account information for person: \(accountZoro.holderName)")
print("Deposit information:")
accountZoro.deposit(amount: 202020202011)
print("Withdraw information:")
accountZoro.withdraw(amount: 202020)
print("\n")







/*                  -- 5 --
 შექმენით enum-ი Genre მუსიკის ჟანრის ქეისებით. ამის შემდეგ შექმენით struct Song, with properties: title, artist, duration, genre, description (computied propertie უნდა იყოს description) და publisher (lazy propertie-ად შექმენით publisher). შემდეგ შექმენით თქვენი playlist array რომელსაც Song-ებით შეავსებთ (ზოგ song-ს ჰქონდეს publisher, ზოგს არა). შექმენით function რომელსაც გადააწვდით თქვენს playlist-ს და ჟანრს, function-ს დააბრუნებინეთ მხოლოდ იმ Song-ების array, რომელიც ამ ჟანრის იქნება და შემდეგ დაა-print-ინეთ ეს Song-ები.
 */
enum Genre {
    case rock
    case heavyMetal
    case hiphop
}

struct Song {
    var title: String
    var artist: String
    var duration: Double
    var genre: Genre
    var description: String {
        return "\(title) by \(artist) (\(duration)) - \(genre) "
    }
    lazy var publisher: String = ""
}

var myPlaylist: [Song] = [
    Song(title: "Paint it, Black", artist: "The rolling Stones", duration: 3.46, genre: .rock),
    Song(title: "I want to Break Free", artist: "Queen", duration: 4.31, genre: .rock),
    Song(title: "Paranoid", artist: "Black Sabbath", duration: 2.51, genre: .heavyMetal, publisher: "Vertigo Records"),
    Song(title: "Stairway to Heaven", artist: "Led Zeppelin", duration: 8.02, genre: .rock),
    Song(title: "From the D 2 the LBC", artist: "Eminem & Snoop Dogg", duration: 4.46, genre: .hiphop),
    Song(title: "Lose Yourself", artist: "Eminem", duration: 320.0, genre: .hiphop, publisher: "EMI Blackwood Music Inc")
]

func checkGenre(_ playlist: [Song], genre: Genre) -> [Song] {
    return playlist.filter{ $0.genre == genre }
}

let choosenGenre = Genre.heavyMetal
let filteredSongs = checkGenre(myPlaylist, genre: choosenGenre)

print("The songs in the choosen genre - \(choosenGenre):")



for var songs in filteredSongs{
    print(songs.description, songs.publisher)

}

