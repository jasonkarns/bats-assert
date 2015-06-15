# bats-assert
Assertion library for BATS (Bash Automated Testing System)

## Installation

Recommended installation is via git submodule. Assuming your project's bats
tests are in `tests`:

```
git submodule add https://github.com/jasonkarns/bats-assert tests/helpers/assertions
git commit -am 'added bats-assert module'
```

then in `tests/test_helper.bash`:

```
load helpers/assertions/all
```

## Assertion API

**assert**: asserts command returns successfully

``` bash
assert "my-command"
```

**flunk**: forces a test failure with an optional message

``` bash
flunk
# or
flunk "expected blue skies"
```

**assert_success**: asserts successful exit `$status` and `$output`

``` bash
run my-command

assert_success
# or
assert_success "expected output"
```

**assert_failure**: asserts unsuccessful exit `$status` and `$output`

``` bash
run my-command

assert_failure
# or
assert_failure "expected output"
```

**assert_equal**: asserts equality

``` bash
actual="$(my-command)"
expected="my results"

assert_equal expected actual
```

**assert_contains**: asserts x contains y

```
assert_contains foobar foo
```

**assert_output**: asserts `$output`

```
run my-command

assert_output "my results"
```

**assert_output_contains**: asserts `$output` contains argument

```
run my-command

assert_output_contains "results"
```

**assert_line**: asserts `$output` contains given line (at optional line index)

```
run my-command

assert_line "my results"
# or
assert_line 0 "my results"
```

**refute_line**: asserts `$output` does *not* contain given line

```
run my-command

refute_line "thirsty rando"
```

**assert_line_starts_with**: asserts `$output` contains a line starting with argument

```
run my-command

assert_line_starts_with "my"
# or
assert_line_starts_with 0 "my"
```

## Credits

Assertion functions taken from the test_helpers of [rbenv][], [ruby-build][],
and [rbenv-aliases][]. Many thanks to their authors and contributors: [Sam
Stephenson](https://github.com/sstephenson), [Mislav
Marohnić](https://github.com/mislav), and [Tim Pope](https://github.com/tpope).

[rbenv]:https://github.com/sstephenson/rbenv
[ruby-build]:https://github.com/sstephenson/ruby-build
[rbenv-aliases]:https://github.com/tpope/rbenv-aliases
