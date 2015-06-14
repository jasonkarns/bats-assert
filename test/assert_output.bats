#!/usr/bin/env bats

load ../all

@test "assert_output should pass when it matches" {
  output=foo

  set +e
  assert_output foo
  status=$?
  set -e

  test $status = 0
}

@test "assert_output should fail when it doesn't match" {
  output=foo

  set +e
  assert_output bar
  status=$?
  set -e

  test $status = 1
}

@test "assert_output should emit error message when fails" {
  output=foo

  set +e
  stderr=$( { assert_output bar; } 2>&1 )
  set -e

  test "$stderr" = $'expected: bar\nactual:   foo'
}

@test "assert_output can take argument from STDIN" {
  output=foo

  set +e
  stderr=$( { echo bar | assert_output; } 2>&1 )
  status=$?
  set -e

  test $status = 1
  test "$stderr" = $'expected: bar\nactual:   foo'
}
