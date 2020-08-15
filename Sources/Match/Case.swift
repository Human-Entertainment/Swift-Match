public struct Case<Values: Equatable, Return> {
    let values: [Values]
    let closure: () -> Return
    
    init(_ values: Values..., case closure: @escaping () -> Return)
    {
        self.closure = closure
        self.values = values
    }
}

