@dynamicCallable
public protocol Match {
    associatedtype Result
    
    var closure: () -> Result { get }
    
    func dynamicallyCall(withArguments: [Void]) -> Result
}

extension Match {
    public func dynamicallyCall(withArguments: [Void]) -> Result {
        closure()
    }
}
