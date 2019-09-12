# Testing Rust Code

This repo contains examples of many common features and approaches for testing [Rust](https://www.rust-lang.org/) code. Some of the features come out of the box, and others from libraries. I tried to pick the most popular tools for each purpose, since they work well for most common use cases and you're likely to encounter these libraries in real world projects.

Our example project is just one trivially simple function (`factorial`) that's built both as a library and a command line application. That way we can demonstrate the testing of both libraries and executables.

## Links to Examples


- [Basic unit tests](src/lib.rs#L30) are the simplest thing to get started with. Rust supports these out of the box, without any libraries.
- [Doc tests](src/lib.rs#L8) are a really cool Rust feature that executes code that's included in the doc comments. This can be used to check for correctness for very simple functions, but oftentimes you'll want to have regular unit tests for more complex functions. They also ensure that the examples included in your comments are actually correct! Doc tests can be attached to just about anything, not just functions. More info on doc tests can be found [here](https://doc.rust-lang.org/rustdoc/documentation-tests.html)
- [Property based testing](src/lib.rs#L40) is an excellent approach for testing certian types of functions. This approach to testing was popularized by a Haskell library called QuickCheck, but now just about every language has some similar library available. For this example, we're using the Rust [quickcheck crate](https://github.com/BurntSushi/quickcheck). The nice thing about property-based testing is that it can quickly find boundary conditions.
- [Library integration tests](tests/lib_tests.rs) allow you to write integration tests that use your library just like a normal dependency. This forces you to use only the public API that's exposed by your library. Integration tests are supported out of the box, without any additional libraries.
- [Application integration tests](tests/cli_test.rs) allow you to test the public api of an executable. Rust is particularly great for creating command line interfaces, so this example shows off the excellent [assert\_cmd](https://github.com/assert-rs/assert_cmd) crate. 
- [Benchmarks](benches/factorial_benchmark.rs) are often overlooked form of testing, but they can be extremely important in some cases. Rust does have some built-in support for benchmarks, but the [Criterion crate](https://github.com/bheisler/criterion.rs) is really the standard for benchmarking in Rust, and it's not hard to see why. Criterion has just about every feature you could need, including the ability to compare benchmarks across different builds, and even generate reports with fancy graphs.



