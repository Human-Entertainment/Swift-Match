public func match<Value, Return>(_ value: Value, @CaseBuilder cases: () -> [Case<Value, Return>]) -> Return? where Value: Equatable{
    cases().first { currentCase in
        currentCase.values.contains(value)
    }?.closure()
}


