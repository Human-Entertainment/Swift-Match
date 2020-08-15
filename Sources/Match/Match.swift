@_functionBuilder
public struct CaseBuilder {
    public static func buildBlock<Value, Result>(_ cases: Case<Value, Result>...) -> [Case<Value, Result>] {
        cases
    }
}

public struct Case<Values: Equatable, Return> {
    let values: [Values]
    let closure: () -> Return
    
    init(_ values: Values..., case closure: @escaping () -> Return)
    {
        self.closure = closure
        self.values = values
    }
}

public func match<Value, Return>(_ value: Value, @CaseBuilder cases: () -> [Case<Value, Return>]) -> Return? where Value: Equatable{
    cases().first { currentCase in
        currentCase.values.contains(value)
    }?.closure()
}


