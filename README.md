This repository contains examples of [the Handle pattern](https://jaspervdj.be/posts/2018-03-08-handle-pattern.html). We start from `simple` that contains domain logic and iterate trying to use records and backpack as a way to test the domain logic.

- `simple` is a library with two modules: `WeatherProvider` (provides data) and `WeatherReporter` (uses the data to create a report).

- `simple-handle` introduces a single-implementation Handle to both modules.

- `records-handle` implements a polymorphic Handle for `WeatherProvider` allowing us to replace the implementation and write tests for domain logic.

- `backpack-handle` does the same thing as `records-handle` but using Backpack instead. It allows us to specialize function calls.

- `backpack-handles` goes further and makes `WeatherProvider` and `WeatherReporter` signatures.

- `vinyl-handle` explores the design space using `vinyl` instead of records as Handle. It supports the extension of the interfaces since `vinyl` allows to add fields to the records.
