/// Evaluation of a given value
infix operator => : AssignmentPrecedence
public struct given<Values: Equatable, Return>: Matcher {
    public func dynamicallyCall(withArguments: [Void]) -> Return {
        closure()
    }
    
    let values: [Values]
    public let closure: () -> Return
    
    /// Description
    /// - Parameters:
    ///   - values: The values to evaluate against
    ///   - closure: If a value is matched from here, then this is the function whitch will be called.
    public init(_ values: Values...,
         perform closure: @escaping () -> Return)
    {
        self.closure = closure
        self.values = values
    }
    
    public init(_ values: [Values],
         perform closure: @escaping () -> Return)
    {
        self.closure = closure
        self.values = values
    }

}

public func =><Values: Equatable, Return>(
    values: Values,
    closure: @escaping () -> Return
) -> given<Values, Return>
{
    .init([values], perform: closure)
}

public func =><Values: Equatable, Return>(
    values: [Values],
    closure: @escaping () -> Return
) -> given<Values, Return>
{
    .init(values, perform: closure)
}

public func =><Values: Equatable, Return>(
    values: Values,
    closure: Return
) -> given<Values, Return>
{
    .init([values], perform: { closure } )
}

public func =><Values: Equatable, Return>(
    values: [Values],
    closure: Return
) -> given<Values, Return>
{
    .init(values, perform: { closure } )
}
