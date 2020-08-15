@_functionBuilder
public struct CaseBuilder {
    public static func buildBlock<Value, Result>(_ cases: Case<Value, Result>...) -> [Case<Value, Result>] {
        cases
    }
}
