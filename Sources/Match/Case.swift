/// Evaluation of a given value
public struct Case<Values: Equatable, Return> {
    let values: [Values]
    let closure: () -> Return
    
    /// <#Description#>
    /// - Parameters:
    ///   - values: The values to evaluate against
    ///   - closure: If a value is matched from here, then this is the function whitch will be called.
    init(_ values: Values...,
         perform closure: @escaping () -> Return)
    {
        self.closure = closure
        self.values = values
    }
}
