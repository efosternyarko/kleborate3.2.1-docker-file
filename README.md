# Kleborate v3.2.1 Docker Image with E. coli Module

This repository contains a Dockerized version of **Kleborate v3.2.1**, enhanced with modules supporting *Escherichia coli*. Kleborate is a genotyping tool for detecting antimicrobial resistance (AMR), virulence factors, and sequence types in *Klebsiella pneumoniae* and now also *E. coli* genomes.

## 🚀 Quick Start

You can pull and run the image using:

```bash
docker pull myebenn/kleborate:3.2.1

# Example usage
docker run --rm -v $(pwd):/data myebenn/kleborate:3.2.1 genome_assembly.fasta

🔧 Features
Based on Kleborate v3.2.1

Supports typing for Klebsiella pneumoniae and Escherichia coli

Includes dependencies:

kleborate

ectyper

stxtyper

amrfinderplus

ezclermont

📝 Inputs
Genome assemblies in FASTA format (e.g., assembly.fasta)

📦 Container Info
Base image: continuumio/miniconda3:latest

Docker Hub: myebenn/kleborate

Dockstore: registry.hub.docker.com/myebenn/kleborate/kleborate-ecoli

📖 Citation
If you use Kleborate in your work, please cite:

Lam MMC, Wick RR, Wyres KL, Holt KE. Kleborate: genomic surveillance framework for Klebsiella pneumoniae and related species. bioRxiv (2020). https://doi.org/10.1101/2020.11.06.372678

🧪 Test
To confirm successful installation:

```bash

docker run --rm myebenn/kleborate:3.2.1 --version

🙋 Contact
For issues, questions, or further information about Kleborate, please contact the **Holt Lab** via the official repository:

🔗 https://github.com/klebgenomics/Kleborate
