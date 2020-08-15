@_functionBuilder
public struct CaseBuilder {
    public static func buildBlock<Value, Result>(_ cases: given<Value, Result>...) -> [given<Value, Result>] {
        cases
    }
}
