cwlVersion: v1.0
class: CommandLineTool
baseCommand: kleborate
inputs:
  - id: input
    type: File
    inputBinding:
      position: 1
outputs:
  output:
    type: stdout
    outputBinding:
      glob: output.txt
stdout: output.txt
requirements:
  DockerRequirement:
    dockerPull: myebenn/kleborate:3.2.1

