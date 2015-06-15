#!/usr/bin/env bats

load ../all

@test "assert_output_contains should pass when true" {
  output=foobar

  set +e
  assert_output_contains bar
  status=$?
  set -e

  test $status = 0
}

@test "assert_output_contains should fail when it doesn't match" {
  output=foo

  set +e
  assert_output_contains bar
  status=$?
  set -e

  test $status = 1
}

@test "assert_output_contains should emit error message when fails" {
  output=foo

  set +e
  stderr=$( { assert_output_contains bar; } 2>&1 )
  set -e

  test "$stderr" = $'expected:   foo\nto contain: bar'
}

@test "assert_output_contains can take argument from STDIN" {
  output=foo

  set +e
  stderr=$( { echo bar | assert_output_contains; } 2>&1 )
  status=$?
  set -e

  test $status = 1
  test "$stderr" = $'expected:   foo\nto contain: bar'
}
