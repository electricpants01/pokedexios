//
//  Constants.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 23/4/21.
//

import Foundation

struct Constants {
    struct StoryBoard {
        static let listViewStoryBoardID = "ListView"
        static let detailViewStoryBoardID = "DetailView"
        static let filtersViewStoryBoardID = "FiltersMenuView"
        static let MenuViewStoryBoardID = "SortMenuViewController"
        static let generationsViewStoryBoardID = "GenerationsView"
        static let statsViewStoryBoardID = "DetailStatsView"
        static let evolutionsViewStoryBoardID = "DetailEvolutionsView"
    }
    struct PokeApi {
        static let graphqlURL = "https://beta.pokeapi.co/graphql/v1beta"
        static let baseURL = "https://pokeapi.co/api/v2/"
        static let officialArtworkImageURL = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/"
        static let officialItemImageURL = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/items/"
        static let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        static let databaseName = "pokemon.sqlite"
    }
    struct CellView {
        static let cellIdentifier = "Cell"
    }
    struct FiltersMenuCell {
        static let nibName = "FiltersMenuCollectionCell"
        static let reuseIdentifier = "FiltersMenuTypeReuseIdentifier"
    }
    struct BaseStatsCell {
        static let nibName = "StatsCustomCell"
        static let reuseIdentifier = "StatsCustomCellTypeReuseIdentifier"
    }
    struct TypeDefensesCell {
        static let nibName = "TypeDefensesCustomCell"
        static let reuseIdentifier = "TypeDefensesTypeReuseIdentifier"
    }
    struct ChainEvolutionsCell {
        static let nibName = "ChainEvolutionCustomCell"
        static let reuseIdentifier = "ChainEvolutionTypeReuseIdentifier"
    }
    struct FiltersMenuValues {
        static let pokemonTypes = ["bug", "dark", "dragon", "electric", "fairy", "fighting", "fire", "flying", "ghost", "grass", "ground", "ice", "normal", "poison", "psychic", "rock", "steel", "water"]
        static let typeIds = [7, 17, 16, 13, 18, 2, 10, 3, 8, 12, 5, 15, 1, 4, 14, 6, 9, 11]
        static let pokemonHeights = ["short", "medium", "tall"]
        static let pokemonWeights = ["light", "normalW", "heavy"]
        static let pokemonHeightsValues = [0, 15, 25, 1000]
        static let pokemonWeightsValues = [0, 1000, 2500, 100000]
    }
    struct PokemonCell {
        static let cellIdentifier = "CustomPokemonTableViewCell"
    }
    struct PokemonColor {
        static let textColorId = "textColorId"
        static let backgroundPattern = "back-pattern"
        static let backgroundEvolution = "back-evolution"
    }
    struct GenerationCell {
        static let nibName = "GenerationCollectionViewCell"
        static let reuseIdentifier = "GenerationReusableCell"
    }
    struct GenerationColors {
        static let dotsImageStartColor = "GenerationsDotsImageStartColor"
        static let dotsImageEndColor = "GenerationsDotsImageEndColor"
        static let pokeballImageStartColor = "GenerationsPokeballImageStartColor"
        static let pokeballImageEndColor = "GenerationsPokeballImageEndColor"
        static let backgroundSelected = "GenerationsBackgroundSelected"
        static let background = "GenerationsBackground"
        static let textColor = "GenerationsTextColor"
    }
    struct GenerationPokemons {
        static let firstGenerationFire = "004"
        static let firstGenerationGrass = "001"
        static let firstGenerationWater = "007"
        static let secondGenerationFire = "155"
        static let secondGenerationGrass = "152"
        static let secondGenerationWater = "158"
        static let thirdGenerationFire = "255"
        static let thirdGenerationGrass = "252"
        static let thirdGenerationWater = "258"
        static let fourthGenerationFire = "390"
        static let fourthGenerationGrass = "387"
        static let fourthGenerationWater = "393"
        static let fifthGenerationFire = "498"
        static let fifthGenerationGrass = "495"
        static let fifthGenerationWater = "501"
        static let sixthGenerationFire = "653"
        static let sixthGenerationGrass = "650"
        static let sixthGenerationWater = "656"
        static let seventhGenerationFire = "725"
        static let seventhGenerationGrass = "722"
        static let seventhGenerationWater = "728"
        static let eightGenerationFire = "813"
        static let eightGenerationGrass = "810"
        static let eightGenerationWater = "816"
    }
    struct SearchbarColors {
        static let backgroundColor = "searchBar"
        static let placeholderColor = "placeholder"
    }
    struct Fonts {
        static let regular = "SFProDisplay-Regular"
        static let medium = "SFProDisplay-Medium"
        static let bold = "SFProDisplay-Bold"
    }
    enum Damage {
        case double
        case normal
        case half
        case non
    }
    struct PokemonTypeDefenses {
        static let title = "Type Defenses"
        static let defaultTitleColort = "normal"
        static let subTitle = "The effectiveness of each type on"
        static let subTitleColor = "GenerationsTextColor"
        static let labels = ["¼", "½", "0", "", "2", "4"]
        static let typeNames = ["normal", "fire", "water", "electric", "grass", "ice", "fighting", "poison", "ground", "flying", "psychic", "bug", "rock", "ghost", "dragon", "dark", "steel", "fairy"]
        static let typeIds = [1, 10, 11, 13, 12, 15, 2, 4, 5, 3, 14, 7, 6, 8, 16, 17, 9, 18]
        static let damageRelations = [[Damage.normal, Damage.double, Damage.normal, Damage.normal, Damage.normal, Damage.normal, Damage.normal, Damage.non, Damage.normal,
                                       Damage.normal, Damage.normal, Damage.normal, Damage.normal, Damage.normal, Damage.normal, Damage.normal, Damage.normal, Damage.normal],
                                      [Damage.normal, Damage.normal, Damage.double, Damage.normal, Damage.normal, Damage.half, Damage.half, Damage.normal, Damage.normal,
                                       Damage.normal, Damage.normal, Damage.normal, Damage.normal, Damage.double, Damage.normal, Damage.normal, Damage.half, Damage.double],
                                      [Damage.normal, Damage.half, Damage.normal, Damage.normal, Damage.non, Damage.double, Damage.half, Damage.normal, Damage.normal,
                                       Damage.normal, Damage.normal, Damage.half, Damage.double, Damage.normal, Damage.double, Damage.normal, Damage.normal, Damage.normal],
                                      [Damage.normal, Damage.half, Damage.normal, Damage.half, Damage.double, Damage.normal, Damage.half, Damage.normal, Damage.normal,
                                       Damage.normal, Damage.normal, Damage.half, Damage.normal, Damage.double, Damage.normal, Damage.normal, Damage.normal, Damage.half],
                                      [Damage.normal, Damage.normal, Damage.normal, Damage.half, Damage.normal, Damage.half, Damage.normal, Damage.normal, Damage.normal,
                                       Damage.normal, Damage.double, Damage.double, Damage.non, Damage.normal, Damage.double, Damage.normal, Damage.normal, Damage.normal],
                                      [Damage.half, Damage.double, Damage.half, Damage.half, Damage.double, Damage.normal, Damage.normal, Damage.normal, Damage.double,
                                       Damage.half, Damage.double, Damage.double, Damage.normal, Damage.normal, Damage.normal, Damage.normal, Damage.normal, Damage.normal],
                                      [Damage.normal, Damage.half, Damage.double, Damage.normal, Damage.half, Damage.double, Damage.normal, Damage.normal, Damage.normal,
                                       Damage.double, Damage.normal, Damage.half, Damage.normal, Damage.normal, Damage.normal, Damage.normal, Damage.normal, Damage.normal],
                                      [Damage.non, Damage.non, Damage.normal, Damage.half, Damage.normal, Damage.normal, Damage.half, Damage.double, Damage.normal,
                                       Damage.normal, Damage.normal, Damage.normal, Damage.normal, Damage.normal, Damage.normal, Damage.normal, Damage.double, Damage.normal],
                                      [Damage.half, Damage.double, Damage.half, Damage.non, Damage.double, Damage.half, Damage.half, Damage.normal, Damage.half,
                                       Damage.double, Damage.normal, Damage.half, Damage.normal, Damage.half, Damage.half, Damage.half, Damage.normal, Damage.half],
                                      [Damage.normal, Damage.normal, Damage.normal, Damage.normal, Damage.double, Damage.double, Damage.half, Damage.normal, Damage.half,
                                       Damage.half, Damage.double, Damage.half, Damage.normal, Damage.normal, Damage.half, Damage.normal, Damage.normal, Damage.half],
                                      [Damage.normal, Damage.normal, Damage.normal, Damage.normal, Damage.normal, Damage.normal, Damage.normal, Damage.normal, Damage.half,
                                       Damage.half, Damage.half, Damage.double, Damage.double, Damage.normal, Damage.half, Damage.normal, Damage.normal, Damage.normal],
                                      [Damage.normal, Damage.normal, Damage.double, Damage.double, Damage.half, Damage.normal, Damage.double, Damage.normal, Damage.normal,
                                       Damage.double, Damage.half, Damage.half, Damage.half, Damage.normal, Damage.double, Damage.normal, Damage.normal, Damage.normal],
                                      [Damage.normal, Damage.normal, Damage.half, Damage.normal, Damage.double, Damage.normal, Damage.normal, Damage.normal, Damage.half,
                                       Damage.normal, Damage.normal, Damage.normal, Damage.half, Damage.normal, Damage.normal, Damage.normal, Damage.normal, Damage.normal],
                                      [Damage.normal, Damage.half, Damage.normal, Damage.normal, Damage.normal, Damage.normal, Damage.double, Damage.double, Damage.normal,
                                       Damage.normal, Damage.normal, Damage.normal, Damage.normal, Damage.half, Damage.normal, Damage.normal, Damage.double, Damage.normal],
                                      [Damage.normal, Damage.double, Damage.normal, Damage.normal, Damage.normal, Damage.double, Damage.normal, Damage.normal, Damage.double,
                                       Damage.double, Damage.normal, Damage.normal, Damage.normal, Damage.normal, Damage.half, Damage.normal, Damage.normal, Damage.normal],
                                      [Damage.normal, Damage.normal, Damage.normal, Damage.normal, Damage.normal, Damage.normal, Damage.normal, Damage.normal, Damage.normal,
                                       Damage.half, Damage.half, Damage.half, Damage.half, Damage.normal, Damage.double, Damage.double, Damage.normal, Damage.double],
                                      [Damage.normal, Damage.double, Damage.normal, Damage.normal, Damage.normal, Damage.normal, Damage.double, Damage.half, Damage.normal,
                                       Damage.normal, Damage.normal, Damage.normal, Damage.normal, Damage.non, Damage.normal, Damage.normal, Damage.half, Damage.double],
                                      [Damage.normal, Damage.half, Damage.normal, Damage.double, Damage.normal, Damage.normal, Damage.half, Damage.normal, Damage.double,
                                       Damage.normal, Damage.normal, Damage.normal, Damage.normal, Damage.normal, Damage.normal, Damage.non, Damage.half, Damage.normal]]
        static let defaultPokemonName = "pokémon"
    }
    struct EvolutionChart {
        static let title = "Evolution Chart"
        static let defaultTriggerImage = ""
        static let levelLabel = "Level"
        static let minHappiness = "Happiness"
        static let minAffection = "Affection"
        static let timeOfDay = "During the"
        static let noMinLevel = "(No Min. Level)"
        static let useItem = "(Use Item)"
        static let other = "(Other)"
        static let trade = "(Trade)"
        static let shed = "(Shed)"
        static let specialChainEvolution = [133]
        static let noEvolutionsFound = "No pokemon evolutions found"
    }
    struct PokemonTypeCell {
        static let nibName = "PokemonTypeCollectionViewCell"
        static let reuseIdentifier = "PokemonTypeReusableCell"
    }
    struct TopPokemonDetail {
        static let nibName = "TopPokemonDetail"
    }
    struct DetailViewContent {
        static let aboutView = "AboutView"
        static let statsView = "StatsView"
        static let evolutionView = "EvolutionView"
    }
    struct FontTypes {
        static let displayBold = "SFProDisplay-Bold"
        static let displayMedium = "SFProDisplay-Medium"
        static let displayRegular = "SFProDisplay-Regular"
    }
    struct PokemonFontFamily {
        static let fontName = "SF Pro Display"
    }
    struct GenderColors {
        static let femaleColor = "female"
        static let maleColor = "male"
    }
    struct PokemonStats {
        static let names = ["HP", "Attack", "Defense", "Sp. Atk", "Sp. Def", "Speed", "Total"]
        static let hpMinAddition = 110
        static let hpMaxAdditon = 204
        static let statMinAddition = 5
        static let statMaxAddition = 99
        static let hinderingNatureValue = 0.9
        static let beneficialNatureValue = 1.1
        static let minLevelLabel = "Min"
        static let maxLevelLabel = "Max"
        static let noStatsFound = "No pokemon stats found"
    }
    struct PokemonString {
        static let empty = ""
    }
}
