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
    public static var basePath = "http://localhost"
    public static var customHeaders: [String: String] = [:]
    public static var credential: URLCredential?
    public static var requestBuilderFactory: RequestBuilderFactory = URLSessionRequestBuilderFactory()
    public static var apiResponseQueue: DispatchQueue = .main
}

open class RequestBuilder<T> {
    var credential: URLCredential?
    var headers: [String: String]
    public let parameters: [String: Any]?
    public let method: String
    public let URLString: String

    /// Optional block to obtain a reference to the request's progress instance when available.
    /// With the URLSession http client the request's progress only works on iOS 11.0, macOS 10.13, macCatalyst 13.0, tvOS 11.0, watchOS 4.0.
    /// If you need to get the request's progress in older OS versions, please use Alamofire http client.
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
    
    @discardableResult
    open func execute(_ apiResponseQueue: DispatchQueue = PetstoreClientAPI.apiResponseQueue, _ completion: @escaping (_ result: Swift.Result<Response<T>, ErrorResponse>) -> Void) -> URLSessionDataTask? {
        return nil
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
