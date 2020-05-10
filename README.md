# Testing Rust Code (DOCKER EDITION)

Process is to build an image which gets stored as a container. Then the CI build would build a new image that gets cache from prebuilt image. Unfortunately, even though we get the target folder from the prebuilt image, cargo insists on recompiling everything. Why?


```bash
# build image to cache cargo build. This build also runs a mock test to make sure everything gets compiled:
docker build . --target build -t emag3m/example:build

# build next image that gets cache from ---^, copies in src folder, and runs tests
docker build . --cache-from=emag3m/example:build -t emag3m/example:0.1.0
```

target folder + Cargo.* files are successfully copied in from cache, but everything gets rebuilt nonetheless :(
