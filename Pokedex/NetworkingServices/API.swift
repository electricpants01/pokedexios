// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class GetPokemonDetailQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query getPokemonDetail($_eq: Int = 1) {
      pokemon_v2_pokemonspecies(where: {id: {_eq: $_eq}}) {
        __typename
        base_happiness
        capture_rate
        hatch_counter
        name
        gender_rate
        pokemon_v2_pokemons {
          __typename
          base_experience
          height
          id
          is_default
          name
          pokemon_species_id
          weight
          pokemon_v2_pokemonstats(order_by: {stat_id: asc}) {
            __typename
            base_stat
            stat_id
            effort
            pokemon_v2_stat {
              __typename
              name
            }
          }
          pokemon_v2_pokemonabilities(where: {}) {
            __typename
            pokemon_v2_ability {
              __typename
              name
            }
            is_hidden
          }
          pokemon_v2_pokemontypes {
            __typename
            type_id
          }
        }
        pokemon_v2_pokemonspeciesnames(where: {language_id: {_eq: 9}}) {
          __typename
          genus
          language_id
        }
        pokemon_v2_growthrate {
          __typename
          name
          id
        }
        pokemon_v2_pokemonegggroups {
          __typename
          pokemon_v2_egggroup {
            __typename
            name
            id
          }
        }
        pokemon_v2_pokemondexnumbers {
          __typename
          pokemon_v2_pokedex {
            __typename
            pokemon_v2_pokedexdescriptions(where: {language_id: {_eq: 9}}) {
              __typename
              description
            }
            pokemon_v2_pokedexnames(where: {language_id: {_eq: 9}}) {
              __typename
              name
            }
          }
          pokedex_number
        }
        pokemon_v2_evolutionchain {
          __typename
          id
          pokemon_v2_pokemonspecies(order_by: {order: asc}) {
            __typename
            id
            name
            pokemon_v2_pokemonevolutions {
              __typename
              min_level
              pokemon_v2_evolutiontrigger {
                __typename
                id
                name
              }
              pokemon_v2_item {
                __typename
                id
                name
              }
              min_affection
              min_beauty
              min_happiness
              time_of_day
            }
            order
            pokemon_v2_pokemonspeciesflavortexts(
              where: {language_id: {_eq: 9}}
              order_by: {id: desc}
            ) {
              __typename
              flavor_text
              version_id
            }
          }
        }
      }
    }
    """

  public let operationName: String = "getPokemonDetail"

  public var _eq: Int?

  public init(_eq: Int? = nil) {
    self._eq = _eq
  }

  public var variables: GraphQLMap? {
    return ["_eq": _eq]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("pokemon_v2_pokemonspecies", arguments: ["where": ["id": ["_eq": GraphQLVariable("_eq")]]], type: .nonNull(.list(.nonNull(.object(PokemonV2Pokemonspecy.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(pokemonV2Pokemonspecies: [PokemonV2Pokemonspecy]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "pokemon_v2_pokemonspecies": pokemonV2Pokemonspecies.map { (value: PokemonV2Pokemonspecy) -> ResultMap in value.resultMap }])
    }

    /// An array relationship
    public var pokemonV2Pokemonspecies: [PokemonV2Pokemonspecy] {
      get {
        return (resultMap["pokemon_v2_pokemonspecies"] as! [ResultMap]).map { (value: ResultMap) -> PokemonV2Pokemonspecy in PokemonV2Pokemonspecy(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: PokemonV2Pokemonspecy) -> ResultMap in value.resultMap }, forKey: "pokemon_v2_pokemonspecies")
      }
    }

    public struct PokemonV2Pokemonspecy: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["pokemon_v2_pokemonspecies"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("base_happiness", type: .scalar(Int.self)),
          GraphQLField("capture_rate", type: .scalar(Int.self)),
          GraphQLField("hatch_counter", type: .scalar(Int.self)),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("gender_rate", type: .scalar(Int.self)),
          GraphQLField("pokemon_v2_pokemons", type: .nonNull(.list(.nonNull(.object(PokemonV2Pokemon.selections))))),
          GraphQLField("pokemon_v2_pokemonspeciesnames", arguments: ["where": ["language_id": ["_eq": 9]]], type: .nonNull(.list(.nonNull(.object(PokemonV2Pokemonspeciesname.selections))))),
          GraphQLField("pokemon_v2_growthrate", type: .object(PokemonV2Growthrate.selections)),
          GraphQLField("pokemon_v2_pokemonegggroups", type: .nonNull(.list(.nonNull(.object(PokemonV2Pokemonegggroup.selections))))),
          GraphQLField("pokemon_v2_pokemondexnumbers", type: .nonNull(.list(.nonNull(.object(PokemonV2Pokemondexnumber.selections))))),
          GraphQLField("pokemon_v2_evolutionchain", type: .object(PokemonV2Evolutionchain.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(baseHappiness: Int? = nil, captureRate: Int? = nil, hatchCounter: Int? = nil, name: String, genderRate: Int? = nil, pokemonV2Pokemons: [PokemonV2Pokemon], pokemonV2Pokemonspeciesnames: [PokemonV2Pokemonspeciesname], pokemonV2Growthrate: PokemonV2Growthrate? = nil, pokemonV2Pokemonegggroups: [PokemonV2Pokemonegggroup], pokemonV2Pokemondexnumbers: [PokemonV2Pokemondexnumber], pokemonV2Evolutionchain: PokemonV2Evolutionchain? = nil) {
        self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokemonspecies", "base_happiness": baseHappiness, "capture_rate": captureRate, "hatch_counter": hatchCounter, "name": name, "gender_rate": genderRate, "pokemon_v2_pokemons": pokemonV2Pokemons.map { (value: PokemonV2Pokemon) -> ResultMap in value.resultMap }, "pokemon_v2_pokemonspeciesnames": pokemonV2Pokemonspeciesnames.map { (value: PokemonV2Pokemonspeciesname) -> ResultMap in value.resultMap }, "pokemon_v2_growthrate": pokemonV2Growthrate.flatMap { (value: PokemonV2Growthrate) -> ResultMap in value.resultMap }, "pokemon_v2_pokemonegggroups": pokemonV2Pokemonegggroups.map { (value: PokemonV2Pokemonegggroup) -> ResultMap in value.resultMap }, "pokemon_v2_pokemondexnumbers": pokemonV2Pokemondexnumbers.map { (value: PokemonV2Pokemondexnumber) -> ResultMap in value.resultMap }, "pokemon_v2_evolutionchain": pokemonV2Evolutionchain.flatMap { (value: PokemonV2Evolutionchain) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var baseHappiness: Int? {
        get {
          return resultMap["base_happiness"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "base_happiness")
        }
      }

      public var captureRate: Int? {
        get {
          return resultMap["capture_rate"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "capture_rate")
        }
      }

      public var hatchCounter: Int? {
        get {
          return resultMap["hatch_counter"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "hatch_counter")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var genderRate: Int? {
        get {
          return resultMap["gender_rate"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "gender_rate")
        }
      }

      /// An array relationship
      public var pokemonV2Pokemons: [PokemonV2Pokemon] {
        get {
          return (resultMap["pokemon_v2_pokemons"] as! [ResultMap]).map { (value: ResultMap) -> PokemonV2Pokemon in PokemonV2Pokemon(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: PokemonV2Pokemon) -> ResultMap in value.resultMap }, forKey: "pokemon_v2_pokemons")
        }
      }

      /// An array relationship
      public var pokemonV2Pokemonspeciesnames: [PokemonV2Pokemonspeciesname] {
        get {
          return (resultMap["pokemon_v2_pokemonspeciesnames"] as! [ResultMap]).map { (value: ResultMap) -> PokemonV2Pokemonspeciesname in PokemonV2Pokemonspeciesname(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: PokemonV2Pokemonspeciesname) -> ResultMap in value.resultMap }, forKey: "pokemon_v2_pokemonspeciesnames")
        }
      }

      /// An object relationship
      public var pokemonV2Growthrate: PokemonV2Growthrate? {
        get {
          return (resultMap["pokemon_v2_growthrate"] as? ResultMap).flatMap { PokemonV2Growthrate(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "pokemon_v2_growthrate")
        }
      }

      /// An array relationship
      public var pokemonV2Pokemonegggroups: [PokemonV2Pokemonegggroup] {
        get {
          return (resultMap["pokemon_v2_pokemonegggroups"] as! [ResultMap]).map { (value: ResultMap) -> PokemonV2Pokemonegggroup in PokemonV2Pokemonegggroup(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: PokemonV2Pokemonegggroup) -> ResultMap in value.resultMap }, forKey: "pokemon_v2_pokemonegggroups")
        }
      }

      /// An array relationship
      public var pokemonV2Pokemondexnumbers: [PokemonV2Pokemondexnumber] {
        get {
          return (resultMap["pokemon_v2_pokemondexnumbers"] as! [ResultMap]).map { (value: ResultMap) -> PokemonV2Pokemondexnumber in PokemonV2Pokemondexnumber(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: PokemonV2Pokemondexnumber) -> ResultMap in value.resultMap }, forKey: "pokemon_v2_pokemondexnumbers")
        }
      }

      /// An object relationship
      public var pokemonV2Evolutionchain: PokemonV2Evolutionchain? {
        get {
          return (resultMap["pokemon_v2_evolutionchain"] as? ResultMap).flatMap { PokemonV2Evolutionchain(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "pokemon_v2_evolutionchain")
        }
      }

      public struct PokemonV2Pokemon: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["pokemon_v2_pokemon"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("base_experience", type: .scalar(Int.self)),
            GraphQLField("height", type: .scalar(Int.self)),
            GraphQLField("id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("is_default", type: .nonNull(.scalar(Bool.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("pokemon_species_id", type: .scalar(Int.self)),
            GraphQLField("weight", type: .scalar(Int.self)),
            GraphQLField("pokemon_v2_pokemonstats", arguments: ["order_by": ["stat_id": "asc"]], type: .nonNull(.list(.nonNull(.object(PokemonV2Pokemonstat.selections))))),
            GraphQLField("pokemon_v2_pokemonabilities", arguments: ["where": [:]], type: .nonNull(.list(.nonNull(.object(PokemonV2Pokemonability.selections))))),
            GraphQLField("pokemon_v2_pokemontypes", type: .nonNull(.list(.nonNull(.object(PokemonV2Pokemontype.selections))))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(baseExperience: Int? = nil, height: Int? = nil, id: Int, isDefault: Bool, name: String, pokemonSpeciesId: Int? = nil, weight: Int? = nil, pokemonV2Pokemonstats: [PokemonV2Pokemonstat], pokemonV2Pokemonabilities: [PokemonV2Pokemonability], pokemonV2Pokemontypes: [PokemonV2Pokemontype]) {
          self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokemon", "base_experience": baseExperience, "height": height, "id": id, "is_default": isDefault, "name": name, "pokemon_species_id": pokemonSpeciesId, "weight": weight, "pokemon_v2_pokemonstats": pokemonV2Pokemonstats.map { (value: PokemonV2Pokemonstat) -> ResultMap in value.resultMap }, "pokemon_v2_pokemonabilities": pokemonV2Pokemonabilities.map { (value: PokemonV2Pokemonability) -> ResultMap in value.resultMap }, "pokemon_v2_pokemontypes": pokemonV2Pokemontypes.map { (value: PokemonV2Pokemontype) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var baseExperience: Int? {
          get {
            return resultMap["base_experience"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "base_experience")
          }
        }

        public var height: Int? {
          get {
            return resultMap["height"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "height")
          }
        }

        public var id: Int {
          get {
            return resultMap["id"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var isDefault: Bool {
          get {
            return resultMap["is_default"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "is_default")
          }
        }

        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var pokemonSpeciesId: Int? {
          get {
            return resultMap["pokemon_species_id"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "pokemon_species_id")
          }
        }

        public var weight: Int? {
          get {
            return resultMap["weight"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "weight")
          }
        }

        /// An array relationship
        public var pokemonV2Pokemonstats: [PokemonV2Pokemonstat] {
          get {
            return (resultMap["pokemon_v2_pokemonstats"] as! [ResultMap]).map { (value: ResultMap) -> PokemonV2Pokemonstat in PokemonV2Pokemonstat(unsafeResultMap: value) }
          }
          set {
            resultMap.updateValue(newValue.map { (value: PokemonV2Pokemonstat) -> ResultMap in value.resultMap }, forKey: "pokemon_v2_pokemonstats")
          }
        }

        /// An array relationship
        public var pokemonV2Pokemonabilities: [PokemonV2Pokemonability] {
          get {
            return (resultMap["pokemon_v2_pokemonabilities"] as! [ResultMap]).map { (value: ResultMap) -> PokemonV2Pokemonability in PokemonV2Pokemonability(unsafeResultMap: value) }
          }
          set {
            resultMap.updateValue(newValue.map { (value: PokemonV2Pokemonability) -> ResultMap in value.resultMap }, forKey: "pokemon_v2_pokemonabilities")
          }
        }

        /// An array relationship
        public var pokemonV2Pokemontypes: [PokemonV2Pokemontype] {
          get {
            return (resultMap["pokemon_v2_pokemontypes"] as! [ResultMap]).map { (value: ResultMap) -> PokemonV2Pokemontype in PokemonV2Pokemontype(unsafeResultMap: value) }
          }
          set {
            resultMap.updateValue(newValue.map { (value: PokemonV2Pokemontype) -> ResultMap in value.resultMap }, forKey: "pokemon_v2_pokemontypes")
          }
        }

        public struct PokemonV2Pokemonstat: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["pokemon_v2_pokemonstat"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("base_stat", type: .nonNull(.scalar(Int.self))),
              GraphQLField("stat_id", type: .scalar(Int.self)),
              GraphQLField("effort", type: .nonNull(.scalar(Int.self))),
              GraphQLField("pokemon_v2_stat", type: .object(PokemonV2Stat.selections)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(baseStat: Int, statId: Int? = nil, effort: Int, pokemonV2Stat: PokemonV2Stat? = nil) {
            self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokemonstat", "base_stat": baseStat, "stat_id": statId, "effort": effort, "pokemon_v2_stat": pokemonV2Stat.flatMap { (value: PokemonV2Stat) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var baseStat: Int {
            get {
              return resultMap["base_stat"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "base_stat")
            }
          }

          public var statId: Int? {
            get {
              return resultMap["stat_id"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "stat_id")
            }
          }

          public var effort: Int {
            get {
              return resultMap["effort"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "effort")
            }
          }

          /// An object relationship
          public var pokemonV2Stat: PokemonV2Stat? {
            get {
              return (resultMap["pokemon_v2_stat"] as? ResultMap).flatMap { PokemonV2Stat(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "pokemon_v2_stat")
            }
          }

          public struct PokemonV2Stat: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["pokemon_v2_stat"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("name", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(name: String) {
              self.init(unsafeResultMap: ["__typename": "pokemon_v2_stat", "name": name])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var name: String {
              get {
                return resultMap["name"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }
          }
        }

        public struct PokemonV2Pokemonability: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["pokemon_v2_pokemonability"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("pokemon_v2_ability", type: .object(PokemonV2Ability.selections)),
              GraphQLField("is_hidden", type: .nonNull(.scalar(Bool.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(pokemonV2Ability: PokemonV2Ability? = nil, isHidden: Bool) {
            self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokemonability", "pokemon_v2_ability": pokemonV2Ability.flatMap { (value: PokemonV2Ability) -> ResultMap in value.resultMap }, "is_hidden": isHidden])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// An object relationship
          public var pokemonV2Ability: PokemonV2Ability? {
            get {
              return (resultMap["pokemon_v2_ability"] as? ResultMap).flatMap { PokemonV2Ability(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "pokemon_v2_ability")
            }
          }

          public var isHidden: Bool {
            get {
              return resultMap["is_hidden"]! as! Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "is_hidden")
            }
          }

          public struct PokemonV2Ability: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["pokemon_v2_ability"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("name", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(name: String) {
              self.init(unsafeResultMap: ["__typename": "pokemon_v2_ability", "name": name])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var name: String {
              get {
                return resultMap["name"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }
          }
        }

        public struct PokemonV2Pokemontype: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["pokemon_v2_pokemontype"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("type_id", type: .scalar(Int.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(typeId: Int? = nil) {
            self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokemontype", "type_id": typeId])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var typeId: Int? {
            get {
              return resultMap["type_id"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "type_id")
            }
          }
        }
      }

      public struct PokemonV2Pokemonspeciesname: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["pokemon_v2_pokemonspeciesname"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("genus", type: .nonNull(.scalar(String.self))),
            GraphQLField("language_id", type: .scalar(Int.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(genus: String, languageId: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokemonspeciesname", "genus": genus, "language_id": languageId])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var genus: String {
          get {
            return resultMap["genus"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "genus")
          }
        }

        public var languageId: Int? {
          get {
            return resultMap["language_id"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "language_id")
          }
        }
      }

      public struct PokemonV2Growthrate: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["pokemon_v2_growthrate"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String, id: Int) {
          self.init(unsafeResultMap: ["__typename": "pokemon_v2_growthrate", "name": name, "id": id])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var id: Int {
          get {
            return resultMap["id"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }
      }

      public struct PokemonV2Pokemonegggroup: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["pokemon_v2_pokemonegggroup"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("pokemon_v2_egggroup", type: .object(PokemonV2Egggroup.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(pokemonV2Egggroup: PokemonV2Egggroup? = nil) {
          self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokemonegggroup", "pokemon_v2_egggroup": pokemonV2Egggroup.flatMap { (value: PokemonV2Egggroup) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// An object relationship
        public var pokemonV2Egggroup: PokemonV2Egggroup? {
          get {
            return (resultMap["pokemon_v2_egggroup"] as? ResultMap).flatMap { PokemonV2Egggroup(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "pokemon_v2_egggroup")
          }
        }

        public struct PokemonV2Egggroup: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["pokemon_v2_egggroup"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(Int.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String, id: Int) {
            self.init(unsafeResultMap: ["__typename": "pokemon_v2_egggroup", "name": name, "id": id])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var id: Int {
            get {
              return resultMap["id"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }
        }
      }

      public struct PokemonV2Pokemondexnumber: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["pokemon_v2_pokemondexnumber"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("pokemon_v2_pokedex", type: .object(PokemonV2Pokedex.selections)),
            GraphQLField("pokedex_number", type: .nonNull(.scalar(Int.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(pokemonV2Pokedex: PokemonV2Pokedex? = nil, pokedexNumber: Int) {
          self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokemondexnumber", "pokemon_v2_pokedex": pokemonV2Pokedex.flatMap { (value: PokemonV2Pokedex) -> ResultMap in value.resultMap }, "pokedex_number": pokedexNumber])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// An object relationship
        public var pokemonV2Pokedex: PokemonV2Pokedex? {
          get {
            return (resultMap["pokemon_v2_pokedex"] as? ResultMap).flatMap { PokemonV2Pokedex(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "pokemon_v2_pokedex")
          }
        }

        public var pokedexNumber: Int {
          get {
            return resultMap["pokedex_number"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "pokedex_number")
          }
        }

        public struct PokemonV2Pokedex: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["pokemon_v2_pokedex"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("pokemon_v2_pokedexdescriptions", arguments: ["where": ["language_id": ["_eq": 9]]], type: .nonNull(.list(.nonNull(.object(PokemonV2Pokedexdescription.selections))))),
              GraphQLField("pokemon_v2_pokedexnames", arguments: ["where": ["language_id": ["_eq": 9]]], type: .nonNull(.list(.nonNull(.object(PokemonV2Pokedexname.selections))))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(pokemonV2Pokedexdescriptions: [PokemonV2Pokedexdescription], pokemonV2Pokedexnames: [PokemonV2Pokedexname]) {
            self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokedex", "pokemon_v2_pokedexdescriptions": pokemonV2Pokedexdescriptions.map { (value: PokemonV2Pokedexdescription) -> ResultMap in value.resultMap }, "pokemon_v2_pokedexnames": pokemonV2Pokedexnames.map { (value: PokemonV2Pokedexname) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// An array relationship
          public var pokemonV2Pokedexdescriptions: [PokemonV2Pokedexdescription] {
            get {
              return (resultMap["pokemon_v2_pokedexdescriptions"] as! [ResultMap]).map { (value: ResultMap) -> PokemonV2Pokedexdescription in PokemonV2Pokedexdescription(unsafeResultMap: value) }
            }
            set {
              resultMap.updateValue(newValue.map { (value: PokemonV2Pokedexdescription) -> ResultMap in value.resultMap }, forKey: "pokemon_v2_pokedexdescriptions")
            }
          }

          /// An array relationship
          public var pokemonV2Pokedexnames: [PokemonV2Pokedexname] {
            get {
              return (resultMap["pokemon_v2_pokedexnames"] as! [ResultMap]).map { (value: ResultMap) -> PokemonV2Pokedexname in PokemonV2Pokedexname(unsafeResultMap: value) }
            }
            set {
              resultMap.updateValue(newValue.map { (value: PokemonV2Pokedexname) -> ResultMap in value.resultMap }, forKey: "pokemon_v2_pokedexnames")
            }
          }

          public struct PokemonV2Pokedexdescription: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["pokemon_v2_pokedexdescription"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("description", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(description: String) {
              self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokedexdescription", "description": description])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var description: String {
              get {
                return resultMap["description"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "description")
              }
            }
          }

          public struct PokemonV2Pokedexname: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["pokemon_v2_pokedexname"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("name", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(name: String) {
              self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokedexname", "name": name])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var name: String {
              get {
                return resultMap["name"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }
          }
        }
      }

      public struct PokemonV2Evolutionchain: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["pokemon_v2_evolutionchain"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("pokemon_v2_pokemonspecies", arguments: ["order_by": ["order": "asc"]], type: .nonNull(.list(.nonNull(.object(PokemonV2Pokemonspecy.selections))))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int, pokemonV2Pokemonspecies: [PokemonV2Pokemonspecy]) {
          self.init(unsafeResultMap: ["__typename": "pokemon_v2_evolutionchain", "id": id, "pokemon_v2_pokemonspecies": pokemonV2Pokemonspecies.map { (value: PokemonV2Pokemonspecy) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: Int {
          get {
            return resultMap["id"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        /// An array relationship
        public var pokemonV2Pokemonspecies: [PokemonV2Pokemonspecy] {
          get {
            return (resultMap["pokemon_v2_pokemonspecies"] as! [ResultMap]).map { (value: ResultMap) -> PokemonV2Pokemonspecy in PokemonV2Pokemonspecy(unsafeResultMap: value) }
          }
          set {
            resultMap.updateValue(newValue.map { (value: PokemonV2Pokemonspecy) -> ResultMap in value.resultMap }, forKey: "pokemon_v2_pokemonspecies")
          }
        }

        public struct PokemonV2Pokemonspecy: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["pokemon_v2_pokemonspecies"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(Int.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
              GraphQLField("pokemon_v2_pokemonevolutions", type: .nonNull(.list(.nonNull(.object(PokemonV2Pokemonevolution.selections))))),
              GraphQLField("order", type: .scalar(Int.self)),
              GraphQLField("pokemon_v2_pokemonspeciesflavortexts", arguments: ["where": ["language_id": ["_eq": 9]], "order_by": ["id": "desc"]], type: .nonNull(.list(.nonNull(.object(PokemonV2Pokemonspeciesflavortext.selections))))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: Int, name: String, pokemonV2Pokemonevolutions: [PokemonV2Pokemonevolution], order: Int? = nil, pokemonV2Pokemonspeciesflavortexts: [PokemonV2Pokemonspeciesflavortext]) {
            self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokemonspecies", "id": id, "name": name, "pokemon_v2_pokemonevolutions": pokemonV2Pokemonevolutions.map { (value: PokemonV2Pokemonevolution) -> ResultMap in value.resultMap }, "order": order, "pokemon_v2_pokemonspeciesflavortexts": pokemonV2Pokemonspeciesflavortexts.map { (value: PokemonV2Pokemonspeciesflavortext) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: Int {
            get {
              return resultMap["id"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          /// An array relationship
          public var pokemonV2Pokemonevolutions: [PokemonV2Pokemonevolution] {
            get {
              return (resultMap["pokemon_v2_pokemonevolutions"] as! [ResultMap]).map { (value: ResultMap) -> PokemonV2Pokemonevolution in PokemonV2Pokemonevolution(unsafeResultMap: value) }
            }
            set {
              resultMap.updateValue(newValue.map { (value: PokemonV2Pokemonevolution) -> ResultMap in value.resultMap }, forKey: "pokemon_v2_pokemonevolutions")
            }
          }

          public var order: Int? {
            get {
              return resultMap["order"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "order")
            }
          }

          /// An array relationship
          public var pokemonV2Pokemonspeciesflavortexts: [PokemonV2Pokemonspeciesflavortext] {
            get {
              return (resultMap["pokemon_v2_pokemonspeciesflavortexts"] as! [ResultMap]).map { (value: ResultMap) -> PokemonV2Pokemonspeciesflavortext in PokemonV2Pokemonspeciesflavortext(unsafeResultMap: value) }
            }
            set {
              resultMap.updateValue(newValue.map { (value: PokemonV2Pokemonspeciesflavortext) -> ResultMap in value.resultMap }, forKey: "pokemon_v2_pokemonspeciesflavortexts")
            }
          }

          public struct PokemonV2Pokemonevolution: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["pokemon_v2_pokemonevolution"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("min_level", type: .scalar(Int.self)),
                GraphQLField("pokemon_v2_evolutiontrigger", type: .object(PokemonV2Evolutiontrigger.selections)),
                GraphQLField("pokemon_v2_item", type: .object(PokemonV2Item.selections)),
                GraphQLField("min_affection", type: .scalar(Int.self)),
                GraphQLField("min_beauty", type: .scalar(Int.self)),
                GraphQLField("min_happiness", type: .scalar(Int.self)),
                GraphQLField("time_of_day", type: .scalar(String.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(minLevel: Int? = nil, pokemonV2Evolutiontrigger: PokemonV2Evolutiontrigger? = nil, pokemonV2Item: PokemonV2Item? = nil, minAffection: Int? = nil, minBeauty: Int? = nil, minHappiness: Int? = nil, timeOfDay: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokemonevolution", "min_level": minLevel, "pokemon_v2_evolutiontrigger": pokemonV2Evolutiontrigger.flatMap { (value: PokemonV2Evolutiontrigger) -> ResultMap in value.resultMap }, "pokemon_v2_item": pokemonV2Item.flatMap { (value: PokemonV2Item) -> ResultMap in value.resultMap }, "min_affection": minAffection, "min_beauty": minBeauty, "min_happiness": minHappiness, "time_of_day": timeOfDay])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var minLevel: Int? {
              get {
                return resultMap["min_level"] as? Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "min_level")
              }
            }

            /// An object relationship
            public var pokemonV2Evolutiontrigger: PokemonV2Evolutiontrigger? {
              get {
                return (resultMap["pokemon_v2_evolutiontrigger"] as? ResultMap).flatMap { PokemonV2Evolutiontrigger(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "pokemon_v2_evolutiontrigger")
              }
            }

            /// An object relationship
            public var pokemonV2Item: PokemonV2Item? {
              get {
                return (resultMap["pokemon_v2_item"] as? ResultMap).flatMap { PokemonV2Item(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "pokemon_v2_item")
              }
            }

            public var minAffection: Int? {
              get {
                return resultMap["min_affection"] as? Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "min_affection")
              }
            }

            public var minBeauty: Int? {
              get {
                return resultMap["min_beauty"] as? Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "min_beauty")
              }
            }

            public var minHappiness: Int? {
              get {
                return resultMap["min_happiness"] as? Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "min_happiness")
              }
            }

            public var timeOfDay: String? {
              get {
                return resultMap["time_of_day"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "time_of_day")
              }
            }

            public struct PokemonV2Evolutiontrigger: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["pokemon_v2_evolutiontrigger"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("id", type: .nonNull(.scalar(Int.self))),
                  GraphQLField("name", type: .nonNull(.scalar(String.self))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(id: Int, name: String) {
                self.init(unsafeResultMap: ["__typename": "pokemon_v2_evolutiontrigger", "id": id, "name": name])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var id: Int {
                get {
                  return resultMap["id"]! as! Int
                }
                set {
                  resultMap.updateValue(newValue, forKey: "id")
                }
              }

              public var name: String {
                get {
                  return resultMap["name"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "name")
                }
              }
            }

            public struct PokemonV2Item: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["pokemon_v2_item"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("id", type: .nonNull(.scalar(Int.self))),
                  GraphQLField("name", type: .nonNull(.scalar(String.self))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(id: Int, name: String) {
                self.init(unsafeResultMap: ["__typename": "pokemon_v2_item", "id": id, "name": name])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var id: Int {
                get {
                  return resultMap["id"]! as! Int
                }
                set {
                  resultMap.updateValue(newValue, forKey: "id")
                }
              }

              public var name: String {
                get {
                  return resultMap["name"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "name")
                }
              }
            }
          }

          public struct PokemonV2Pokemonspeciesflavortext: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["pokemon_v2_pokemonspeciesflavortext"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("flavor_text", type: .nonNull(.scalar(String.self))),
                GraphQLField("version_id", type: .scalar(Int.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(flavorText: String, versionId: Int? = nil) {
              self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokemonspeciesflavortext", "flavor_text": flavorText, "version_id": versionId])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var flavorText: String {
              get {
                return resultMap["flavor_text"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "flavor_text")
              }
            }

            public var versionId: Int? {
              get {
                return resultMap["version_id"] as? Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "version_id")
              }
            }
          }
        }
      }
    }
  }
}

public final class GetAllPokemonsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query getAllPokemons {
      pokemons: pokemon_v2_pokemon {
        __typename
        name
        id
        pokemon_v2_pokemontypes {
          __typename
          type_id
        }
      }
    }
    """

  public let operationName: String = "getAllPokemons"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("pokemon_v2_pokemon", alias: "pokemons", type: .nonNull(.list(.nonNull(.object(Pokemon.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(pokemons: [Pokemon]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "pokemons": pokemons.map { (value: Pokemon) -> ResultMap in value.resultMap }])
    }

    /// fetch data from the table: "pokemon_v2_pokemon"
    public var pokemons: [Pokemon] {
      get {
        return (resultMap["pokemons"] as! [ResultMap]).map { (value: ResultMap) -> Pokemon in Pokemon(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Pokemon) -> ResultMap in value.resultMap }, forKey: "pokemons")
      }
    }

    public struct Pokemon: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["pokemon_v2_pokemon"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("pokemon_v2_pokemontypes", type: .nonNull(.list(.nonNull(.object(PokemonV2Pokemontype.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String, id: Int, pokemonV2Pokemontypes: [PokemonV2Pokemontype]) {
        self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokemon", "name": name, "id": id, "pokemon_v2_pokemontypes": pokemonV2Pokemontypes.map { (value: PokemonV2Pokemontype) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// An array relationship
      public var pokemonV2Pokemontypes: [PokemonV2Pokemontype] {
        get {
          return (resultMap["pokemon_v2_pokemontypes"] as! [ResultMap]).map { (value: ResultMap) -> PokemonV2Pokemontype in PokemonV2Pokemontype(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: PokemonV2Pokemontype) -> ResultMap in value.resultMap }, forKey: "pokemon_v2_pokemontypes")
        }
      }

      public struct PokemonV2Pokemontype: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["pokemon_v2_pokemontype"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("type_id", type: .scalar(Int.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(typeId: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokemontype", "type_id": typeId])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var typeId: Int? {
          get {
            return resultMap["type_id"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "type_id")
          }
        }
      }
    }
  }
}

public final class GetAllPokemonsWithLimitQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query getAllPokemonsWithLimit($limit: Int) {
      pokemons: pokemon_v2_pokemon(limit: $limit) {
        __typename
        id
        name
        height
        weight
        types: pokemon_v2_pokemontypes {
          __typename
          pokemon_v2_type {
            __typename
            id
            name
          }
        }
        generationData: pokemon_v2_pokemonspecy {
          __typename
          generation: pokemon_v2_generation {
            __typename
            id
            name
          }
        }
      }
    }
    """

  public let operationName: String = "getAllPokemonsWithLimit"

  public var limit: Int?

  public init(limit: Int? = nil) {
    self.limit = limit
  }

  public var variables: GraphQLMap? {
    return ["limit": limit]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("pokemon_v2_pokemon", alias: "pokemons", arguments: ["limit": GraphQLVariable("limit")], type: .nonNull(.list(.nonNull(.object(Pokemon.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(pokemons: [Pokemon]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "pokemons": pokemons.map { (value: Pokemon) -> ResultMap in value.resultMap }])
    }

    /// fetch data from the table: "pokemon_v2_pokemon"
    public var pokemons: [Pokemon] {
      get {
        return (resultMap["pokemons"] as! [ResultMap]).map { (value: ResultMap) -> Pokemon in Pokemon(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Pokemon) -> ResultMap in value.resultMap }, forKey: "pokemons")
      }
    }

    public struct Pokemon: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["pokemon_v2_pokemon"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("height", type: .scalar(Int.self)),
          GraphQLField("weight", type: .scalar(Int.self)),
          GraphQLField("pokemon_v2_pokemontypes", alias: "types", type: .nonNull(.list(.nonNull(.object(`Type`.selections))))),
          GraphQLField("pokemon_v2_pokemonspecy", alias: "generationData", type: .object(GenerationDatum.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, name: String, height: Int? = nil, weight: Int? = nil, types: [`Type`], generationData: GenerationDatum? = nil) {
        self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokemon", "id": id, "name": name, "height": height, "weight": weight, "types": types.map { (value: `Type`) -> ResultMap in value.resultMap }, "generationData": generationData.flatMap { (value: GenerationDatum) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var height: Int? {
        get {
          return resultMap["height"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "height")
        }
      }

      public var weight: Int? {
        get {
          return resultMap["weight"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "weight")
        }
      }

      /// An array relationship
      public var types: [`Type`] {
        get {
          return (resultMap["types"] as! [ResultMap]).map { (value: ResultMap) -> `Type` in `Type`(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: `Type`) -> ResultMap in value.resultMap }, forKey: "types")
        }
      }

      /// An object relationship
      public var generationData: GenerationDatum? {
        get {
          return (resultMap["generationData"] as? ResultMap).flatMap { GenerationDatum(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "generationData")
        }
      }

      public struct `Type`: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["pokemon_v2_pokemontype"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("pokemon_v2_type", type: .object(PokemonV2Type.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(pokemonV2Type: PokemonV2Type? = nil) {
          self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokemontype", "pokemon_v2_type": pokemonV2Type.flatMap { (value: PokemonV2Type) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// An object relationship
        public var pokemonV2Type: PokemonV2Type? {
          get {
            return (resultMap["pokemon_v2_type"] as? ResultMap).flatMap { PokemonV2Type(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "pokemon_v2_type")
          }
        }

        public struct PokemonV2Type: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["pokemon_v2_type"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(Int.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: Int, name: String) {
            self.init(unsafeResultMap: ["__typename": "pokemon_v2_type", "id": id, "name": name])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: Int {
            get {
              return resultMap["id"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }
        }
      }

      public struct GenerationDatum: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["pokemon_v2_pokemonspecies"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("pokemon_v2_generation", alias: "generation", type: .object(Generation.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(generation: Generation? = nil) {
          self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokemonspecies", "generation": generation.flatMap { (value: Generation) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// An object relationship
        public var generation: Generation? {
          get {
            return (resultMap["generation"] as? ResultMap).flatMap { Generation(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "generation")
          }
        }

        public struct Generation: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["pokemon_v2_generation"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(Int.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: Int, name: String) {
            self.init(unsafeResultMap: ["__typename": "pokemon_v2_generation", "id": id, "name": name])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: Int {
            get {
              return resultMap["id"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }
        }
      }
    }
  }
}

public final class GetPokemonsApplyingFiltersQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query getPokemonsApplyingFilters($_minId: Int = 1, $_maxId: Int = 11000, $_minH: Int = 0, $_maxH: Int = 10000, $_minW: Int = 0, $_maxW: Int = 100000, $limit: Int = 20, $offset: Int = 0) {
      pokemons: pokemon_v2_pokemon(
        where: {_and: [{id: {_gte: $_minId, _lte: $_maxId}, height: {_gte: $_minH, _lte: $_maxH}, weight: {_gte: $_minW, _lte: $_maxW}}]}
        limit: $limit
        offset: $offset
      ) {
        __typename
        id
        name
        height
        weight
        types: pokemon_v2_pokemontypes {
          __typename
          pokemon_v2_type {
            __typename
            id
            name
          }
        }
        generationData: pokemon_v2_pokemonspecy {
          __typename
          generation: pokemon_v2_generation {
            __typename
            id
            name
          }
        }
      }
    }
    """

  public let operationName: String = "getPokemonsApplyingFilters"

  public var _minId: Int?
  public var _maxId: Int?
  public var _minH: Int?
  public var _maxH: Int?
  public var _minW: Int?
  public var _maxW: Int?
  public var limit: Int?
  public var offset: Int?

  public init(_minId: Int? = nil, _maxId: Int? = nil, _minH: Int? = nil, _maxH: Int? = nil, _minW: Int? = nil, _maxW: Int? = nil, limit: Int? = nil, offset: Int? = nil) {
    self._minId = _minId
    self._maxId = _maxId
    self._minH = _minH
    self._maxH = _maxH
    self._minW = _minW
    self._maxW = _maxW
    self.limit = limit
    self.offset = offset
  }

  public var variables: GraphQLMap? {
    return ["_minId": _minId, "_maxId": _maxId, "_minH": _minH, "_maxH": _maxH, "_minW": _minW, "_maxW": _maxW, "limit": limit, "offset": offset]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("pokemon_v2_pokemon", alias: "pokemons", arguments: ["where": ["_and": [["id": ["_gte": GraphQLVariable("_minId"), "_lte": GraphQLVariable("_maxId")], "height": ["_gte": GraphQLVariable("_minH"), "_lte": GraphQLVariable("_maxH")], "weight": ["_gte": GraphQLVariable("_minW"), "_lte": GraphQLVariable("_maxW")]]]], "limit": GraphQLVariable("limit"), "offset": GraphQLVariable("offset")], type: .nonNull(.list(.nonNull(.object(Pokemon.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(pokemons: [Pokemon]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "pokemons": pokemons.map { (value: Pokemon) -> ResultMap in value.resultMap }])
    }

    /// fetch data from the table: "pokemon_v2_pokemon"
    public var pokemons: [Pokemon] {
      get {
        return (resultMap["pokemons"] as! [ResultMap]).map { (value: ResultMap) -> Pokemon in Pokemon(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Pokemon) -> ResultMap in value.resultMap }, forKey: "pokemons")
      }
    }

    public struct Pokemon: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["pokemon_v2_pokemon"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("height", type: .scalar(Int.self)),
          GraphQLField("weight", type: .scalar(Int.self)),
          GraphQLField("pokemon_v2_pokemontypes", alias: "types", type: .nonNull(.list(.nonNull(.object(`Type`.selections))))),
          GraphQLField("pokemon_v2_pokemonspecy", alias: "generationData", type: .object(GenerationDatum.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, name: String, height: Int? = nil, weight: Int? = nil, types: [`Type`], generationData: GenerationDatum? = nil) {
        self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokemon", "id": id, "name": name, "height": height, "weight": weight, "types": types.map { (value: `Type`) -> ResultMap in value.resultMap }, "generationData": generationData.flatMap { (value: GenerationDatum) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var height: Int? {
        get {
          return resultMap["height"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "height")
        }
      }

      public var weight: Int? {
        get {
          return resultMap["weight"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "weight")
        }
      }

      /// An array relationship
      public var types: [`Type`] {
        get {
          return (resultMap["types"] as! [ResultMap]).map { (value: ResultMap) -> `Type` in `Type`(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: `Type`) -> ResultMap in value.resultMap }, forKey: "types")
        }
      }

      /// An object relationship
      public var generationData: GenerationDatum? {
        get {
          return (resultMap["generationData"] as? ResultMap).flatMap { GenerationDatum(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "generationData")
        }
      }

      public struct `Type`: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["pokemon_v2_pokemontype"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("pokemon_v2_type", type: .object(PokemonV2Type.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(pokemonV2Type: PokemonV2Type? = nil) {
          self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokemontype", "pokemon_v2_type": pokemonV2Type.flatMap { (value: PokemonV2Type) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// An object relationship
        public var pokemonV2Type: PokemonV2Type? {
          get {
            return (resultMap["pokemon_v2_type"] as? ResultMap).flatMap { PokemonV2Type(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "pokemon_v2_type")
          }
        }

        public struct PokemonV2Type: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["pokemon_v2_type"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(Int.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: Int, name: String) {
            self.init(unsafeResultMap: ["__typename": "pokemon_v2_type", "id": id, "name": name])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: Int {
            get {
              return resultMap["id"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }
        }
      }

      public struct GenerationDatum: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["pokemon_v2_pokemonspecies"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("pokemon_v2_generation", alias: "generation", type: .object(Generation.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(generation: Generation? = nil) {
          self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokemonspecies", "generation": generation.flatMap { (value: Generation) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// An object relationship
        public var generation: Generation? {
          get {
            return (resultMap["generation"] as? ResultMap).flatMap { Generation(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "generation")
          }
        }

        public struct Generation: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["pokemon_v2_generation"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(Int.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: Int, name: String) {
            self.init(unsafeResultMap: ["__typename": "pokemon_v2_generation", "id": id, "name": name])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: Int {
            get {
              return resultMap["id"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }
        }
      }
    }
  }
}

public final class GetPokemonsApplyingFiltersWithTypeQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query getPokemonsApplyingFiltersWithType($_minId: Int = 1, $_maxId: Int = 11000, $_minH: Int = 0, $_maxH: Int = 10000, $_minW: Int = 0, $_maxW: Int = 100000, $_typeId: Int = 1, $limit: Int = 20, $offset: Int = 0) {
      pokemons: pokemon_v2_pokemon(
        where: {_and: [{id: {_gte: $_minId, _lte: $_maxId}, height: {_gte: $_minH, _lte: $_maxH}, weight: {_gte: $_minW, _lte: $_maxW}}, {pokemon_v2_pokemontypes: {type_id: {_eq: $_typeId}}}]}
        limit: $limit
        offset: $offset
      ) {
        __typename
        id
        name
        height
        weight
        types: pokemon_v2_pokemontypes {
          __typename
          pokemon_v2_type {
            __typename
            id
            name
          }
        }
        generationData: pokemon_v2_pokemonspecy {
          __typename
          generation: pokemon_v2_generation {
            __typename
            id
            name
          }
        }
      }
    }
    """

  public let operationName: String = "getPokemonsApplyingFiltersWithType"

  public var _minId: Int?
  public var _maxId: Int?
  public var _minH: Int?
  public var _maxH: Int?
  public var _minW: Int?
  public var _maxW: Int?
  public var _typeId: Int?
  public var limit: Int?
  public var offset: Int?

  public init(_minId: Int? = nil, _maxId: Int? = nil, _minH: Int? = nil, _maxH: Int? = nil, _minW: Int? = nil, _maxW: Int? = nil, _typeId: Int? = nil, limit: Int? = nil, offset: Int? = nil) {
    self._minId = _minId
    self._maxId = _maxId
    self._minH = _minH
    self._maxH = _maxH
    self._minW = _minW
    self._maxW = _maxW
    self._typeId = _typeId
    self.limit = limit
    self.offset = offset
  }

  public var variables: GraphQLMap? {
    return ["_minId": _minId, "_maxId": _maxId, "_minH": _minH, "_maxH": _maxH, "_minW": _minW, "_maxW": _maxW, "_typeId": _typeId, "limit": limit, "offset": offset]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("pokemon_v2_pokemon", alias: "pokemons", arguments: ["where": ["_and": [["id": ["_gte": GraphQLVariable("_minId"), "_lte": GraphQLVariable("_maxId")], "height": ["_gte": GraphQLVariable("_minH"), "_lte": GraphQLVariable("_maxH")], "weight": ["_gte": GraphQLVariable("_minW"), "_lte": GraphQLVariable("_maxW")]], ["pokemon_v2_pokemontypes": ["type_id": ["_eq": GraphQLVariable("_typeId")]]]]], "limit": GraphQLVariable("limit"), "offset": GraphQLVariable("offset")], type: .nonNull(.list(.nonNull(.object(Pokemon.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(pokemons: [Pokemon]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "pokemons": pokemons.map { (value: Pokemon) -> ResultMap in value.resultMap }])
    }

    /// fetch data from the table: "pokemon_v2_pokemon"
    public var pokemons: [Pokemon] {
      get {
        return (resultMap["pokemons"] as! [ResultMap]).map { (value: ResultMap) -> Pokemon in Pokemon(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Pokemon) -> ResultMap in value.resultMap }, forKey: "pokemons")
      }
    }

    public struct Pokemon: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["pokemon_v2_pokemon"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("height", type: .scalar(Int.self)),
          GraphQLField("weight", type: .scalar(Int.self)),
          GraphQLField("pokemon_v2_pokemontypes", alias: "types", type: .nonNull(.list(.nonNull(.object(`Type`.selections))))),
          GraphQLField("pokemon_v2_pokemonspecy", alias: "generationData", type: .object(GenerationDatum.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, name: String, height: Int? = nil, weight: Int? = nil, types: [`Type`], generationData: GenerationDatum? = nil) {
        self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokemon", "id": id, "name": name, "height": height, "weight": weight, "types": types.map { (value: `Type`) -> ResultMap in value.resultMap }, "generationData": generationData.flatMap { (value: GenerationDatum) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var height: Int? {
        get {
          return resultMap["height"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "height")
        }
      }

      public var weight: Int? {
        get {
          return resultMap["weight"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "weight")
        }
      }

      /// An array relationship
      public var types: [`Type`] {
        get {
          return (resultMap["types"] as! [ResultMap]).map { (value: ResultMap) -> `Type` in `Type`(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: `Type`) -> ResultMap in value.resultMap }, forKey: "types")
        }
      }

      /// An object relationship
      public var generationData: GenerationDatum? {
        get {
          return (resultMap["generationData"] as? ResultMap).flatMap { GenerationDatum(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "generationData")
        }
      }

      public struct `Type`: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["pokemon_v2_pokemontype"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("pokemon_v2_type", type: .object(PokemonV2Type.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(pokemonV2Type: PokemonV2Type? = nil) {
          self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokemontype", "pokemon_v2_type": pokemonV2Type.flatMap { (value: PokemonV2Type) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// An object relationship
        public var pokemonV2Type: PokemonV2Type? {
          get {
            return (resultMap["pokemon_v2_type"] as? ResultMap).flatMap { PokemonV2Type(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "pokemon_v2_type")
          }
        }

        public struct PokemonV2Type: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["pokemon_v2_type"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(Int.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: Int, name: String) {
            self.init(unsafeResultMap: ["__typename": "pokemon_v2_type", "id": id, "name": name])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: Int {
            get {
              return resultMap["id"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }
        }
      }

      public struct GenerationDatum: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["pokemon_v2_pokemonspecies"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("pokemon_v2_generation", alias: "generation", type: .object(Generation.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(generation: Generation? = nil) {
          self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokemonspecies", "generation": generation.flatMap { (value: Generation) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// An object relationship
        public var generation: Generation? {
          get {
            return (resultMap["generation"] as? ResultMap).flatMap { Generation(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "generation")
          }
        }

        public struct Generation: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["pokemon_v2_generation"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(Int.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: Int, name: String) {
            self.init(unsafeResultMap: ["__typename": "pokemon_v2_generation", "id": id, "name": name])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: Int {
            get {
              return resultMap["id"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }
        }
      }
    }
  }
}

public final class GetAllPokemonsByNumberAscQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query getAllPokemonsByNumberAsc {
      gen3_species: pokemon_v2_pokemon(order_by: {id: asc}) {
        __typename
        name
        id
        pokemon_v2_pokemontypes {
          __typename
          type_id
        }
      }
    }
    """

  public let operationName: String = "getAllPokemonsByNumberAsc"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("pokemon_v2_pokemon", alias: "gen3_species", arguments: ["order_by": ["id": "asc"]], type: .nonNull(.list(.nonNull(.object(Gen3Specy.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(gen3Species: [Gen3Specy]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "gen3_species": gen3Species.map { (value: Gen3Specy) -> ResultMap in value.resultMap }])
    }

    /// fetch data from the table: "pokemon_v2_pokemon"
    public var gen3Species: [Gen3Specy] {
      get {
        return (resultMap["gen3_species"] as! [ResultMap]).map { (value: ResultMap) -> Gen3Specy in Gen3Specy(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Gen3Specy) -> ResultMap in value.resultMap }, forKey: "gen3_species")
      }
    }

    public struct Gen3Specy: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["pokemon_v2_pokemon"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("pokemon_v2_pokemontypes", type: .nonNull(.list(.nonNull(.object(PokemonV2Pokemontype.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String, id: Int, pokemonV2Pokemontypes: [PokemonV2Pokemontype]) {
        self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokemon", "name": name, "id": id, "pokemon_v2_pokemontypes": pokemonV2Pokemontypes.map { (value: PokemonV2Pokemontype) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// An array relationship
      public var pokemonV2Pokemontypes: [PokemonV2Pokemontype] {
        get {
          return (resultMap["pokemon_v2_pokemontypes"] as! [ResultMap]).map { (value: ResultMap) -> PokemonV2Pokemontype in PokemonV2Pokemontype(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: PokemonV2Pokemontype) -> ResultMap in value.resultMap }, forKey: "pokemon_v2_pokemontypes")
        }
      }

      public struct PokemonV2Pokemontype: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["pokemon_v2_pokemontype"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("type_id", type: .scalar(Int.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(typeId: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokemontype", "type_id": typeId])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var typeId: Int? {
          get {
            return resultMap["type_id"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "type_id")
          }
        }
      }
    }
  }
}

public final class GetAllPokemonsByNumberDescQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query getAllPokemonsByNumberDesc {
      gen3_species: pokemon_v2_pokemon(order_by: {id: desc}) {
        __typename
        name
        id
        pokemon_v2_pokemontypes {
          __typename
          type_id
        }
      }
    }
    """

  public let operationName: String = "getAllPokemonsByNumberDesc"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("pokemon_v2_pokemon", alias: "gen3_species", arguments: ["order_by": ["id": "desc"]], type: .nonNull(.list(.nonNull(.object(Gen3Specy.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(gen3Species: [Gen3Specy]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "gen3_species": gen3Species.map { (value: Gen3Specy) -> ResultMap in value.resultMap }])
    }

    /// fetch data from the table: "pokemon_v2_pokemon"
    public var gen3Species: [Gen3Specy] {
      get {
        return (resultMap["gen3_species"] as! [ResultMap]).map { (value: ResultMap) -> Gen3Specy in Gen3Specy(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Gen3Specy) -> ResultMap in value.resultMap }, forKey: "gen3_species")
      }
    }

    public struct Gen3Specy: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["pokemon_v2_pokemon"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("pokemon_v2_pokemontypes", type: .nonNull(.list(.nonNull(.object(PokemonV2Pokemontype.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String, id: Int, pokemonV2Pokemontypes: [PokemonV2Pokemontype]) {
        self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokemon", "name": name, "id": id, "pokemon_v2_pokemontypes": pokemonV2Pokemontypes.map { (value: PokemonV2Pokemontype) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// An array relationship
      public var pokemonV2Pokemontypes: [PokemonV2Pokemontype] {
        get {
          return (resultMap["pokemon_v2_pokemontypes"] as! [ResultMap]).map { (value: ResultMap) -> PokemonV2Pokemontype in PokemonV2Pokemontype(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: PokemonV2Pokemontype) -> ResultMap in value.resultMap }, forKey: "pokemon_v2_pokemontypes")
        }
      }

      public struct PokemonV2Pokemontype: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["pokemon_v2_pokemontype"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("type_id", type: .scalar(Int.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(typeId: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokemontype", "type_id": typeId])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var typeId: Int? {
          get {
            return resultMap["type_id"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "type_id")
          }
        }
      }
    }
  }
}

public final class GetAllPokemonsAlphabeticallyQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query getAllPokemonsAlphabetically {
      gen3_species: pokemon_v2_pokemon(order_by: {name: asc}) {
        __typename
        name
        id
        pokemon_v2_pokemontypes {
          __typename
          type_id
        }
      }
    }
    """

  public let operationName: String = "getAllPokemonsAlphabetically"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("pokemon_v2_pokemon", alias: "gen3_species", arguments: ["order_by": ["name": "asc"]], type: .nonNull(.list(.nonNull(.object(Gen3Specy.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(gen3Species: [Gen3Specy]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "gen3_species": gen3Species.map { (value: Gen3Specy) -> ResultMap in value.resultMap }])
    }

    /// fetch data from the table: "pokemon_v2_pokemon"
    public var gen3Species: [Gen3Specy] {
      get {
        return (resultMap["gen3_species"] as! [ResultMap]).map { (value: ResultMap) -> Gen3Specy in Gen3Specy(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Gen3Specy) -> ResultMap in value.resultMap }, forKey: "gen3_species")
      }
    }

    public struct Gen3Specy: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["pokemon_v2_pokemon"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("pokemon_v2_pokemontypes", type: .nonNull(.list(.nonNull(.object(PokemonV2Pokemontype.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String, id: Int, pokemonV2Pokemontypes: [PokemonV2Pokemontype]) {
        self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokemon", "name": name, "id": id, "pokemon_v2_pokemontypes": pokemonV2Pokemontypes.map { (value: PokemonV2Pokemontype) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// An array relationship
      public var pokemonV2Pokemontypes: [PokemonV2Pokemontype] {
        get {
          return (resultMap["pokemon_v2_pokemontypes"] as! [ResultMap]).map { (value: ResultMap) -> PokemonV2Pokemontype in PokemonV2Pokemontype(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: PokemonV2Pokemontype) -> ResultMap in value.resultMap }, forKey: "pokemon_v2_pokemontypes")
        }
      }

      public struct PokemonV2Pokemontype: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["pokemon_v2_pokemontype"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("type_id", type: .scalar(Int.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(typeId: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokemontype", "type_id": typeId])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var typeId: Int? {
          get {
            return resultMap["type_id"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "type_id")
          }
        }
      }
    }
  }
}

public final class GetAllPokemonsAlphabeticallyReverseQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query getAllPokemonsAlphabeticallyReverse {
      gen3_species: pokemon_v2_pokemon(order_by: {name: desc}) {
        __typename
        name
        id
        pokemon_v2_pokemontypes {
          __typename
          type_id
        }
      }
    }
    """

  public let operationName: String = "getAllPokemonsAlphabeticallyReverse"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("pokemon_v2_pokemon", alias: "gen3_species", arguments: ["order_by": ["name": "desc"]], type: .nonNull(.list(.nonNull(.object(Gen3Specy.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(gen3Species: [Gen3Specy]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "gen3_species": gen3Species.map { (value: Gen3Specy) -> ResultMap in value.resultMap }])
    }

    /// fetch data from the table: "pokemon_v2_pokemon"
    public var gen3Species: [Gen3Specy] {
      get {
        return (resultMap["gen3_species"] as! [ResultMap]).map { (value: ResultMap) -> Gen3Specy in Gen3Specy(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Gen3Specy) -> ResultMap in value.resultMap }, forKey: "gen3_species")
      }
    }

    public struct Gen3Specy: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["pokemon_v2_pokemon"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("pokemon_v2_pokemontypes", type: .nonNull(.list(.nonNull(.object(PokemonV2Pokemontype.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String, id: Int, pokemonV2Pokemontypes: [PokemonV2Pokemontype]) {
        self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokemon", "name": name, "id": id, "pokemon_v2_pokemontypes": pokemonV2Pokemontypes.map { (value: PokemonV2Pokemontype) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// An array relationship
      public var pokemonV2Pokemontypes: [PokemonV2Pokemontype] {
        get {
          return (resultMap["pokemon_v2_pokemontypes"] as! [ResultMap]).map { (value: ResultMap) -> PokemonV2Pokemontype in PokemonV2Pokemontype(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: PokemonV2Pokemontype) -> ResultMap in value.resultMap }, forKey: "pokemon_v2_pokemontypes")
        }
      }

      public struct PokemonV2Pokemontype: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["pokemon_v2_pokemontype"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("type_id", type: .scalar(Int.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(typeId: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokemontype", "type_id": typeId])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var typeId: Int? {
          get {
            return resultMap["type_id"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "type_id")
          }
        }
      }
    }
  }
}

public final class GetPokemonsByGenerationQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetPokemonsByGeneration($_gen: Int) {
      pokemon_v2_generation(where: {id: {_eq: $_gen}}) {
        __typename
        pokemon_v2_pokemonspecies {
          __typename
          pokemon_v2_pokemons {
            __typename
            id
            name
            pokemon_v2_pokemontypes {
              __typename
              type_id
            }
          }
        }
      }
    }
    """

  public let operationName: String = "GetPokemonsByGeneration"

  public var _gen: Int?

  public init(_gen: Int? = nil) {
    self._gen = _gen
  }

  public var variables: GraphQLMap? {
    return ["_gen": _gen]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("pokemon_v2_generation", arguments: ["where": ["id": ["_eq": GraphQLVariable("_gen")]]], type: .nonNull(.list(.nonNull(.object(PokemonV2Generation.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(pokemonV2Generation: [PokemonV2Generation]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "pokemon_v2_generation": pokemonV2Generation.map { (value: PokemonV2Generation) -> ResultMap in value.resultMap }])
    }

    /// fetch data from the table: "pokemon_v2_generation"
    public var pokemonV2Generation: [PokemonV2Generation] {
      get {
        return (resultMap["pokemon_v2_generation"] as! [ResultMap]).map { (value: ResultMap) -> PokemonV2Generation in PokemonV2Generation(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: PokemonV2Generation) -> ResultMap in value.resultMap }, forKey: "pokemon_v2_generation")
      }
    }

    public struct PokemonV2Generation: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["pokemon_v2_generation"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("pokemon_v2_pokemonspecies", type: .nonNull(.list(.nonNull(.object(PokemonV2Pokemonspecy.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(pokemonV2Pokemonspecies: [PokemonV2Pokemonspecy]) {
        self.init(unsafeResultMap: ["__typename": "pokemon_v2_generation", "pokemon_v2_pokemonspecies": pokemonV2Pokemonspecies.map { (value: PokemonV2Pokemonspecy) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// An array relationship
      public var pokemonV2Pokemonspecies: [PokemonV2Pokemonspecy] {
        get {
          return (resultMap["pokemon_v2_pokemonspecies"] as! [ResultMap]).map { (value: ResultMap) -> PokemonV2Pokemonspecy in PokemonV2Pokemonspecy(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: PokemonV2Pokemonspecy) -> ResultMap in value.resultMap }, forKey: "pokemon_v2_pokemonspecies")
        }
      }

      public struct PokemonV2Pokemonspecy: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["pokemon_v2_pokemonspecies"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("pokemon_v2_pokemons", type: .nonNull(.list(.nonNull(.object(PokemonV2Pokemon.selections))))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(pokemonV2Pokemons: [PokemonV2Pokemon]) {
          self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokemonspecies", "pokemon_v2_pokemons": pokemonV2Pokemons.map { (value: PokemonV2Pokemon) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// An array relationship
        public var pokemonV2Pokemons: [PokemonV2Pokemon] {
          get {
            return (resultMap["pokemon_v2_pokemons"] as! [ResultMap]).map { (value: ResultMap) -> PokemonV2Pokemon in PokemonV2Pokemon(unsafeResultMap: value) }
          }
          set {
            resultMap.updateValue(newValue.map { (value: PokemonV2Pokemon) -> ResultMap in value.resultMap }, forKey: "pokemon_v2_pokemons")
          }
        }

        public struct PokemonV2Pokemon: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["pokemon_v2_pokemon"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(Int.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
              GraphQLField("pokemon_v2_pokemontypes", type: .nonNull(.list(.nonNull(.object(PokemonV2Pokemontype.selections))))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: Int, name: String, pokemonV2Pokemontypes: [PokemonV2Pokemontype]) {
            self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokemon", "id": id, "name": name, "pokemon_v2_pokemontypes": pokemonV2Pokemontypes.map { (value: PokemonV2Pokemontype) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: Int {
            get {
              return resultMap["id"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          /// An array relationship
          public var pokemonV2Pokemontypes: [PokemonV2Pokemontype] {
            get {
              return (resultMap["pokemon_v2_pokemontypes"] as! [ResultMap]).map { (value: ResultMap) -> PokemonV2Pokemontype in PokemonV2Pokemontype(unsafeResultMap: value) }
            }
            set {
              resultMap.updateValue(newValue.map { (value: PokemonV2Pokemontype) -> ResultMap in value.resultMap }, forKey: "pokemon_v2_pokemontypes")
            }
          }

          public struct PokemonV2Pokemontype: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["pokemon_v2_pokemontype"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("type_id", type: .scalar(Int.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(typeId: Int? = nil) {
              self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokemontype", "type_id": typeId])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var typeId: Int? {
              get {
                return resultMap["type_id"] as? Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "type_id")
              }
            }
          }
        }
      }
    }
  }
}

public final class GetGenerationsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query getGenerations {
      generations: pokemon_v2_generation {
        __typename
        id
        name
      }
    }
    """

  public let operationName: String = "getGenerations"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("pokemon_v2_generation", alias: "generations", type: .nonNull(.list(.nonNull(.object(Generation.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(generations: [Generation]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "generations": generations.map { (value: Generation) -> ResultMap in value.resultMap }])
    }

    /// fetch data from the table: "pokemon_v2_generation"
    public var generations: [Generation] {
      get {
        return (resultMap["generations"] as! [ResultMap]).map { (value: ResultMap) -> Generation in Generation(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Generation) -> ResultMap in value.resultMap }, forKey: "generations")
      }
    }

    public struct Generation: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["pokemon_v2_generation"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, name: String) {
        self.init(unsafeResultMap: ["__typename": "pokemon_v2_generation", "id": id, "name": name])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }
    }
  }
}
