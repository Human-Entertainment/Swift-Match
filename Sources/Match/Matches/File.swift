@dynamicCallable
public protocol Matcher {
    associatedtype Result
    
    var closure: () -> Result { get }
    
    func dynamicallyCall(withArguments: [Void]) -> Result
}

extension Matcher {
    public func dynamicallyCall(withArguments: [Void]) -> Result {
        closure()
    }
}
