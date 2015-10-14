#!/usr/bin/env bats

@test "Confirm Curator is available" {
  run docker run --rm --name ${DOCKER_IMAGE} ${DOCKER_IMAGE}:${VERSION} --help
  [ $status -eq 1 ]
}

@test "Confirm Curator version" {
  run docker run --rm --name ${DOCKER_IMAGE} ${DOCKER_IMAGE}:${VERSION} --version
  [[ $output =~ "curator v${VERSION}" ]]
}
