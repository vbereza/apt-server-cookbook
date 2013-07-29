#!/usr/bin/env bats  


@test "reprepro is installed" { 
  run reprepro --help
  [ $status -eq 0 ]
}

@test "s3cmd is installed" {
  run s3cmd --version
  [ $status -eq 0 ]
}

@test "s3cmd config exists" {
  [ -f "/root/.s3cfg" ]
}

@test "repository directory exists" {
  [ -d "/var/repository" ]
}
