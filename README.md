# Matcher
An O(n) control flow expression, aiming to feel as native to Swift as possible. It's highly inspired by [Rust's match](https://doc.rust-lang.org/rust-by-example/flow_control/match.html) as well as [C#'s Switch expression](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/operators/switch-expression). This library allows you to store the result from a control flow
## Usage
We provide an extension to the `Equatable` protocol, this extension is two very handy handy `match` methods which looks like this respectively (in this example we use the `2` instance of `Equatable`):
```swift
2.match {
    2 => "Matched two"
}

2.match {
    2 => "Matched two"
} fallback: {
    "Didn't match anything"
}
```
We also allow using `match` as a standalone function for those who prefer. This is done as following:
```swift
match (2) {
    2 => "Matched two"
}
```

The first of these methods returns an optional string, while the latter just returns a string. The fallback function is used as a fallback if the match block doesn't match anything. Of course this example looks like we can only match and either or situation, if we want more case, it'd look as following:
```swift
2.match {
    1 => "Matched one"
    2 => "Matched two"
    3 => "Matched three"
    // etc
}
```

### The `=>` Operator
The reason we don't need the `,` seperator, is because our custom `=>` operator is merely sugar, which is implemented as follows:
```swift
public func =><Values: Equatable, Return>(
    values: Values,
    closure: @escaping () -> Return
) -> given<Values, Return>
{
    given([values], perform: closure)
}
```
There's a few overloads of this operator allowing us to do the following operations:
```swift
// one case, just a return
2 => "Matched two"

// multiple cases, just a simple return
[2,3] => "Matched either two or three"

// one case, return a function to be evaluated
2 => {
    return "Matched two"
}

// multiple cases, return a function to be evaluated
[2,3] => {
    return "Matched either two or three"
}
```

### `Given` and `GivenBuilder`
The reason we could achieve this amazeballs syntax is because our `GivenBuilder` type is a function builder which takes an unlimited amounts of `given` types. `given` has a field which contains an array of cases as well as the callback field to be executed on the first match. We don't have to use the `=>` operator to pass in our match function, we could just as well write it as
```swift
match (2) {
    given (2) {
        return "Matched 2"
    }
    given (3,4) {
        return "Matched 3 or 4"
    }
}
```
which is exactly the same as
```swift
2.match {
    2 => "Matched 2"
    [3,4] => "Matched 3 or 4"
}
```

### Storing the result
If you're not planning to use the result, then we highly recommend using a switch statement. But if you do need to store the result, then you'd do it as follows:
```swift
let two = 2.match {
    2 => "Matched two"
}

print(two) // Optional("Matched two")
```

## Contribution
We're delighted that you're considering contributing to this library. PR's and issues are always welcome! Other wayts to contribute is through donations; if you have benefitted from this project, then look into sponsering our other projects or the people involved.

If you make a PR request, please consider adding yourself to the sponserlist.

Thanks you very much!
