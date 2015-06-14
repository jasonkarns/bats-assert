#!/usr/bin/env bats

load ../all

@test "assert_failure should fail on 0 \$status" {
  status=0

  set +e
  assert_failure
  status=$?
  set -e

  test $status = 1
}

@test "assert_failure should pass on non-zero \$status" {
  status=1

  set +e
  assert_failure
  status=$?
  set -e

  test $status = 0
}

@test "assert_failure should emit message on failure" {
  status=0

  set +e
  stderr=$( { assert_failure; } 2>&1 )
  set -e

  test "$stderr" = $'expected failed exit status'
}

@test "assert_failure should pass when output matching argument" {
  status=7
  output="my bad"

  set +e
  assert_failure "my bad"
  status=$?
  set -e

  test $status = 0
}

@test "assert_failure should fail when output doesn't match argument" {
  status=7
  output="my bad"

  set +e
  stderr=$( { assert_failure "good job"; } 2>&1 )
  status=$?
  set -e

  test $status = 1
  test "$stderr" = $'expected: good job\nactual:   my bad'
}
