import Foundation

struct EventFeed: Decodable {
    let results: [Event]
}

struct Event: Codable, Equatable {
    let title: String
    let description: String
    let date: Date
    let price: Double
}

extension Event {
    static var favoritesKey: String {
        return "Favorites"
    }
    static func save(_ events: [Event], forKey key: String) {
        let defaults = UserDefaults.standard
        let encodedData = try! JSONEncoder().encode(events)
        defaults.set(encodedData, forKey: key)
    }
    
    static func getEvents(forKey key: String) -> [Event] {
        let defaults = UserDefaults.standard
        if let data = defaults.data(forKey: key) {
            let decodedEvents = try! JSONDecoder().decode([Event].self, from: data)
            return decodedEvents
        } else {
            return []
        }
    }
    
    func addToFavorites() {
        var favoriteEvents = Event.getEvents(forKey: Event.favoritesKey)
        favoriteEvents.append(self)
        Event.save(favoriteEvents, forKey: Event.favoritesKey)
    }
    func removeFromFavorites() {
        var favoriteEvents = Event.getEvents(forKey: Event.favoritesKey)
        favoriteEvents.removeAll { event in
            return self == event
        }
        Event.save(favoriteEvents, forKey: Event.favoritesKey)
    }
}

func createMockEvents() -> [Event] {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd/MM/yy HH:mm"

    return [
        Event(title: "Alpha Concert", description: "The long-awaited solo concert of the group “ALPHA” in Almaty. For the first time, the group will perform the full-length album “ALMANY TISTEME: Tom 1” and will also perform the well-known EP albums “-18” and “HIT”, and will delight the audience with their favorite hits and dance numbers. In addition, viewers will have the opportunity to purchase limited-edition band merchandise.", date: dateFormatter.date(from: "28/07/24 19:00") ?? Date(), price: 15000),
        Event(title: "Sxodim Fest 2024", description: "On June 15, 2024, Pervomaiskie ponds will once again turn into the epicenter of fun, because the largest summer Sxodim Fest will take place there! We are gaining momentum to hold the coolest festival of this year especially for you! Last time there were 9,000 of us, but what about this year? This time, expect even more exciting performances by artists, a sea of food zones and a bunch of cool activities. We have expanded the festival format you love, adding even more interesting things! Get ready, it will be very hot, but you can always “cool down” in the new Chill zones. You can also get there in a breeze, we have prepared special shuttles that will take you and take you back safe and sound!Top foreign and Kazakh artists will rock the main stage. Believe me, it will be epic! Come celebrate, hug, meet, laugh and dance together.", date: dateFormatter.date(from: "15/06/24 15:00") ?? Date(), price: 12000),
        Event(title: "Ayau concert", description: "This is Ayau's first solo concert, where she will perform songs from her debut album 'AYAULYM' for the first time. The artist will perform with a live band and with the participation of M’Dee. Ayau is a Kazakh performer and songwriter who performs soft lyrical soul and R&B. She made her debut in September 2022 with the single “‎sensiz?”‎, but the second track “‎sybyrlaiyn <3‎” brought her greater fame. In November 2023 she released her debut album “AYAULYM”. The album included 10 compositions, and the track “kel kel :)” became a big hit in Kazakhstan. The concert will also feature: M’Dee, Rusha, kilemger, MEREY, DELIN.", date: dateFormatter.date(from: "25/05/24 21:00") ?? Date(), price: 9000),
        Event(title: "Picnic BBQ by La Terrassa", description: "Restaurant “La Terrassa” invites you to an outdoor picnic! By purchasing this admission ticket you have access to unlimited drinks (including beer) as well as our buffet table. At the picnic, you will also be able to appreciate the skills of the TOP Grill chefs and get acquainted with their new products. A great start to the summer season with La Terrassa!", date: dateFormatter.date(from: "28/04/24 14:00") ?? Date(), price: 15000),
        Event(title: "Spring Festival at Kok-Tobe", description: "Join us for the annual Spring Festival at Kok-Tobe Park! Enjoy a day filled with live music, cultural performances, and delicious food from local vendors. Take in the breathtaking views of Almaty from the top of Kok-Tobe Hill while participating in fun activities for the whole family. Don't miss this opportunity to celebrate the arrival of spring in the heart of Almaty!", date: dateFormatter.date(from: "15/05/24 10:00") ?? Date(), price: 1000),
        Event(title: "Almaty Jazz Festival", description: "Get ready to groove at the annual Almaty Jazz Festival! Immerse yourself in the soulful melodies and infectious rhythms of jazz music performed by renowned local and international artists. Enjoy a vibrant atmosphere, delicious food, and refreshing drinks as you indulge in the magic of jazz under the starry Almaty sky.", date: dateFormatter.date(from: "08/06/24 18:00") ?? Date(), price: 2500),
        Event(title: "International Food Festival", description: "Embark on a culinary journey at the Almaty International Food Festival! Explore a diverse array of cuisines from around the world as top chefs showcase their culinary prowess. Indulge in mouthwatering dishes, tantalizing desserts, and exotic beverages while enjoying live music and entertainment. Come hungry and leave satisfied!", date: dateFormatter.date(from: "12/07/24 10:00") ?? Date(), price: 0),
        Event(title: "Film Festival", description: "Lights, camera, action! Dive into the world of cinema at the Almaty Film Festival. Discover a curated selection of compelling films from Kazakhstan and beyond, spanning diverse genres and captivating storytelling. Attend screenings, Q&A sessions with filmmakers, and special events celebrating the art of filmmaking. Whether you're a cinephile or casual moviegoer, this festival promises an unforgettable cinematic experience.", date: dateFormatter.date(from: "20/09/24 10:00") ?? Date(), price: 5000)
    ]
}

let mockEvents = createMockEvents()

