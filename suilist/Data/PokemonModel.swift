import Foundation

struct PokemonModel: Decodable, Identifiable {
    let id: Int
    let title: String
    let hp: Int
    let attack: Int
    let defense: Int
    let speed: Int

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case english
        case base
        case hp = "HP"
        case attack = "Attack"
        case defense = "Defense"
        case speed = "Speed"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decode(Int.self, forKey: .id)

        let name = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .name)
        title = try name.decode(String.self, forKey: .english)

        let base = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .base)
        hp = try base.decode(Int.self, forKey: .hp)
        attack = try base.decode(Int.self, forKey: .attack)
        defense = try base.decode(Int.self, forKey: .defense)
        speed = try base.decode(Int.self, forKey: .speed)
    }
}

extension PokemonModel: Equatable {
    static func == (lhs: PokemonModel, rhs: PokemonModel) -> Bool {
        return lhs.id == rhs.id
    }
}
