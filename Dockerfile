FROM rust:1.43-buster AS build

WORKDIR /usr/src/example

RUN rustup default nightly-2020-03-19

COPY Cargo.toml ./
COPY Cargo.lock ./

RUN mkdir -p src && \
    echo "" > src/lib.rs && \
    mkdir -p src/tests && \
    echo "#[test] fn test_mock() {assert_eq!(4, 4)}" > src/tests/mod.rs && \
    cargo build && \
    cargo test --lib && \
    rm -rf src

FROM rust:1.43-buster

WORKDIR /usr/src/example

RUN rustup default nightly-2020-03-19

COPY --from=build /usr/src/example/target ./target
COPY --from=build /usr/src/example/Cargo.toml ./
COPY --from=build /usr/src/example/Cargo.lock ./
COPY . .
RUN cargo build && cargo test --lib
