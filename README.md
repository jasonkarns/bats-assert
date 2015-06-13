# bats-assert
Assertion library for BATS (Bash Automated Testing System)

## Installation

Recommended installation is via git submodule. Assuming your project's bats tests are in `tests`:

```
git submodule add https://github.com/jasonkarns/bats-assert tests/helpers/assertions
git commit -am 'added bats-assert module'
```

then in `tests/test_helper.bash`:

```
load load helpers/assertions/all
```
