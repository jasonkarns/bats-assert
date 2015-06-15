#!/usr/bin/env bats

load ../all

setup() {
  lines=('one fish' 'two fish' 'red fish' 'blue fish')
}

@test "refute_line should fail when the given line is found" {
  set +e
  refute_line "red fish"
  status=$?
  set -e

  test $status = 1
}

@test "refute_line should pass when the given line isn't found" {
  set +e
  refute_line "green eggs and ham"
  status=$?
  set -e

  test $status = 0
}
