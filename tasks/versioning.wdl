version 1.0

task version_capture {
  command <<<
    # emit the Git tag or commit
    echo phbg_version=$(git describe --tags --always)
    # emit the date in ISO8601 UTC
    echo date=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
  >>>

  output {
    # read back those two lines
    String phbg_version = split(read_lines(stdout())[0], "=")[1]
    String date          = split(read_lines(stdout())[1], "=")[1]
  }
}

