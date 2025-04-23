#!/bin/bash
#SBATCH --job-name=fastqc_multiqc
#SBATCH --output=fastqc_multiqc.out
#BATCH --error=fastqc_multiqc.err
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --time=02:00:00
#SBATCH --mem=8G

# making folders
mkdir -p raw_data fastqc_results

cd raw_data

# downloading ERR files
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR142/086/ERR14230586/ERR14230586.fastq.gz -o ERR14230586_Illumina_HiSeq_4000_sequencing.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR142/095/ERR14230595/ERR14230595.fastq.gz -o ERR14230595_Illumina_HiSeq_4000_sequencing.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR142/090/ERR14230590/ERR14230590.fastq.gz -o ERR14230590_Illumina_HiSeq_4000_sequencing.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR142/052/ERR14230552/ERR14230552.fastq.gz -o ERR14230552_Illumina_HiSeq_4000_sequencing.fastq.gz

cd ..

# fastqc
fastqc raw_data/*.fastq.gz -o fastqc_results -t 4

# multiqc
multiqc fastqc_results -o fastqc_results
