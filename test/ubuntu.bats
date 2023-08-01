setup() {
  docker history virtualroot/hardened-ubuntu:22.04 >/dev/null 2>&1
}

@test "whoami app" {
  run docker run virtualroot/hardened-ubuntu:22.04 whoami
  [ $status -eq 0 ]
  [ "${lines[0]}" = "app" ]
}

@test "uid" {
  run docker run virtualroot/hardened-ubuntu:22.04 id -g
  [ $status -eq 0 ]
  [ "${lines[0]}" = "12123" ]
}

@test "gid" {
  run docker run virtualroot/hardened-ubuntu:22.04 id -g
  [ $status -eq 0 ]
  [ "${lines[0]}" = "12123" ]
}

@test "workdir" {
  run docker run virtualroot/hardened-ubuntu:22.04 pwd
  [ $status -eq 0 ]
  [ "${lines[0]}" = "/app" ]
}

