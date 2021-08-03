#!/usr/bin/env bats

load '/usr/local/lib/bats/load.bash'

# Uncomment the following line to debug stub failures
# export BUILDKITE_AGENT_STUB_DEBUG=/dev/tty

@test "deletes checkout directory" {
  export BUILDKITE_BUILD_ID="test-build-id"
  export BUILDKITE_JOB_ID="test-job-id"

  TEST_CHECKOUT_DIR="$HOME/buildkite-checkouts/$BUILDKITE_BUILD_ID/$BUILDKITE_JOB_ID"

  mkdir -p "$TEST_CHECKOUT_DIR"
  assert [ -d "$TEST_CHECKOUT_DIR" ]

  run "$PWD/hooks/pre-exit"

  assert_success
  assert [ ! -d "$TEST_CHECKOUT_DIR" ]
}

