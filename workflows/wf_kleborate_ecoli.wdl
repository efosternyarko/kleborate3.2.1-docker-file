version 1.0

import "./tasks/versioning.wdl" as versioning

task kleborate_one_sample {
  input {
    File   assembly
    String samplename
  }

  command <<<
    set -e
    kleborate --output ${samplename}.kleborate.txt ${assembly}
  >>>

  output {
    File   kleborate_output_file   = "${samplename}.kleborate.txt"
    # first non-comment line is the header, second is your data row
    Array[String] header = split(read_lines(kleborate_output_file)[0], "\t")
    Array[String] row    = split(read_lines(kleborate_output_file)[1], "\t")

    String kleborate_version         = read_string(header[0])
    String kleborate_mlst_sequence_type = row[9]  # zero-based index of “ST”
    Float  kleborate_virulence_score = toFloat(row[ 71 ])
    Float  kleborate_resistance_score= toFloat(row[ 98 ])
  }

  runtime {
    docker: "myebenn/kleborate:3.2.1"
  }
}

workflow kleborate_ecoli_wf {
  input {
    File   assembly
    String samplename
  }

  call kleborate_one_sample {
    input:
      assembly   = assembly,
      samplename = samplename
  }

  call versioning.version_capture

  output {
    String wf_version      = versioning.phbg_version
    String wf_date         = versioning.date

    File   report          = kleborate_one_sample.kleborate_output_file
    String kleb_version    = kleborate_one_sample.kleborate_version
    String mlst            = kleborate_one_sample.kleborate_mlst_sequence_type
    Float  vir_score       = kleborate_one_sample.kleborate_virulence_score
    Float  res_score       = kleborate_one_sample.kleborate_resistance_score
  }
}

