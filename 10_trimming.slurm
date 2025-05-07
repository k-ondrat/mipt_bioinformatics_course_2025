#!/bin/bash
#SBATCH --job-name=fastq_trimming
#SBATCH --output=trimming.log
#SBATCH --error=trimming.err
#SBATCH --time=2:00:00
#SBATCH --cpus-per-task=4
#SBATCH --mem=8G
module load java/1.8.0_60

INPUT_DIR="/projects/mipt_dbmp_biotechnology/genome"
ADAPTER_FILE="${INPUT_DIR}/adapters.fa"
R1="${INPUT_DIR}/illumina_reads_R1_001.fastq"
R2="${INPUT_DIR}/illumina_reads_R2_001.fastq"
MIN_QUALITY=25
MIN_LENGTH=50

trimmomatic PE -phred33 \
	      $R1 $R2 \
	        trimmed_reads/R1_paired.fastq trimmed_reads/R1_unpaired.fastq \
		  trimmed_reads/R2_paired.fastq trimmed_reads/R2_unpaired.fastq \
		    ILLUMINACLIP:${ADAPTER_FILE}:2:30:10 \
		      LEADING:$MIN_QUALITY \
		        TRAILING:$MIN_QUALITY \
			  SLIDINGWINDOW:5:$MIN_QUALITY \
			    MINLEN:$MIN_LENGTH

fastqc -o fastqc_trimmed \
   trimmed_reads/R1_paired.fastq \
  trimmed_reads/R2_paired.fastq
