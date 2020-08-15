@dynamicCallable
protocol Match {
    associatedtype Result
    
    var closure: () -> Result { get }
    
    func dynamicallyCall(withArguments: [Void]) -> Result
}

extension Match {
    func dynamicallyCall(withArguments: [Void]) -> Result {
        closure()
    }
}
