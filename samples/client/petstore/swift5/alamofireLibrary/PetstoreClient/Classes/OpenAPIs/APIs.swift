// APIs.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

// We reverted the change of PetstoreClientAPI to PetstoreClient introduced in https://github.com/OpenAPITools/openapi-generator/pull/9624
// Because it was causing the following issue https://github.com/OpenAPITools/openapi-generator/issues/9953
// If you are affected by this issue, please consider removing the following two lines,
// By setting the option removeMigrationProjectNameClass to true in the generator
@available(*, deprecated, renamed: "PetstoreClientAPI")
public typealias PetstoreClient = PetstoreClientAPI

open class PetstoreClientAPI {
    public static var basePath = "http://petstore.swagger.io:80/v2"
    public static var customHeaders: [String: String] = [:]
    public static var credential: URLCredential?
    public static var requestBuilderFactory: RequestBuilderFactory = AlamofireRequestBuilderFactory()
    public static var apiResponseQueue: DispatchQueue = .main
}

open class RequestBuilder<T> {
    var credential: URLCredential?
    var headers: [String: String]
    public let parameters: [String: Any]?
    public let method: String
    public let URLString: String

    /// Optional block to obtain a reference to the request's progress instance when available.
    public var onProgressReady: ((Progress) -> Void)?

    required public init(method: String, URLString: String, parameters: [String: Any]?, headers: [String: String] = [:]) {
        self.method = method
        self.URLString = URLString
        self.parameters = parameters
        self.headers = headers

        addHeaders(PetstoreClientAPI.customHeaders)
    }

    open func addHeaders(_ aHeaders: [String: String]) {
        for (header, value) in aHeaders {
            headers[header] = value
        }
    }
    
    open func execute(_ apiResponseQueue: DispatchQueue = PetstoreClientAPI.apiResponseQueue, _ completion: @escaping (_ result: Swift.Result<Response<T>, ErrorResponse>) -> Void) {
        
    }

    public func addHeader(name: String, value: String) -> Self {
        if !value.isEmpty {
            headers[name] = value
        }
        return self
    }

    open func addCredential() -> Self {
        credential = PetstoreClientAPI.credential
        return self
    }
}

public protocol RequestBuilderFactory {
    func getNonDecodableBuilder<T>() -> RequestBuilder<T>.Type
    func getBuilder<T: Decodable>() -> RequestBuilder<T>.Type
}
