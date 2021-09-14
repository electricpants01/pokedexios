//
//  ListPokeApiService.swift
//  Pokedex
//
//  Created by Victor Arana on 4/25/21.
//

import Foundation
import Apollo

class PokeApiService {
    static let shared = PokeApiService()
    init() {
        do {
            try initialize()
        } catch {
            print(error)
        }
    }
    func initialize() throws {
        let documentsURL = URL(fileURLWithPath: Constants.PokeApi.documentsPath)
        let sqliteFileURL = documentsURL.appendingPathComponent(Constants.PokeApi.databaseName)
        let sqliteCache = try SQLiteNormalizedCache(fileURL: sqliteFileURL)
        let store = ApolloStore(cache: sqliteCache)
        let interceptorProvider: LegacyInterceptorProvider = LegacyInterceptorProvider(store: store)
        let requestChainNetworkTransport: RequestChainNetworkTransport = RequestChainNetworkTransport(interceptorProvider: interceptorProvider,
                                        endpointURL: URL(string: Constants.PokeApi.graphqlURL)!)
        apollo = ApolloClient(networkTransport: requestChainNetworkTransport, store: store)
    }
    private(set) lazy var apollo = ApolloClient(url: URL(string: Constants.PokeApi.graphqlURL)!)
}
