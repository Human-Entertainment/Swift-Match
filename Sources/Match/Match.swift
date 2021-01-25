
/// A match expression for when you have something returned
/// - Parameters:
///   - value: The value to be evaluated
///   - cases: The cases which can be ecaluated, see `Case`
/// - Returns: The first matching case's return value, if Void, then returns Void. Under some circumstances, no match will be found, and `nil` will then be returned
public func match<Value, Return>(
    _ value: Value,
    @CaseBuilder cases: () -> [given<Value, Return>]
) -> Return? where Value: Equatable
{
    cases()
        .first { currentCase in
            currentCase.values.contains(value)
        }?()
}

public func match<Value, Return>(
    _ value: Value,
    @CaseBuilder cases: () -> [given<Value, Return>],
    fallback: () -> Return
) -> Return where Value: Equatable
{
    match(value, cases: cases) ?? fallback()
}
public extension Equatable {
    func match<Return>(
        @CaseBuilder cases: () -> [given<Self, Return>]
    ) -> Return?
    {
        Match.match(self, cases: cases)
    }
    
    func match<Return>(
        @CaseBuilder cases: () -> [given<Self, Return>],
        fallback: () -> Return
    ) -> Return
    {
        Match.match(
            self,
            cases: cases,
            fallback: fallback
        )
    }
}
