# Analysis of regulatory sequences (UNAM LCG BE-II)

This site contains the support for the course taught by Jacques van Helden to 2nd year students of the Licenciatura en Ciencias Genomicas de la Universidad Nacional Autonoma
de Mexico, in the module  **"Bioinformatica & Estadistica II"**.

## Contents

- [Access](#access)
- [Scope of the course](#scope-of-the-course)
- [Keywords](#keywords)
- [Authors and contributors](#authors-and-contributors)
- [Teaching material](#teaching-material)
- [Resources](#resources)
- [Support or Contact](#support-or-contact)

## Access

- [Web site](http://jvanheld.github.io/LCG_BEII/)
- [Code repository](https://github.com/jvanheld/LCG_Bioinfo-II/)

## Scope of the course

This Web site contains the teaching material for a 1-week course taught by Jacques van Helden to 2nd year\'s students of the Licenciatura en Ciencias Genomicas (LCG) of the Universidad Nacional Autonoma de Mexico (UNAM).

The goal of the course is to introduce bioinformatics and statistical methods to analyse cis-regulatory elements in non-coding DNA sequences. 

## Keywords

- Regulatory Sequence Analysis Tools (RSAT)
- Transcription factor
- Transcription factor binding site (TFBS)
- Transcription factor binding motif (TFBM)
- Bioinformatics
- Statistics
- Genomics
- Next Generation Sequencing (NGS)
- ChIP-seq

## Authors and Contributors

- Jacques van Helden ([ORCID 0000-0002-8799-8584](https://orcid.org/0000-0002-8799-8584))

- Alfredo Hernandez (UNAM, Cuernavaca, Mexico) : deployment of the RSAT server on the LCG server; RSAT containerisation on Singularity. 


****************************************************************
## Teaching material

The slides presented in this course are a subset of a general course on Regulatory Sequence Analysis, available on github. 

- [Web site on gitlab](https://rsa-tools.github.io/course/)
- [gitlab repository](https://github.com/rsa-tools/course)

### From TF binding sites to motifs and back (days 1-2)


| Topics                                                | Supports |
|-------------------------------------------------------|----------|
| Transcriptional regulation | [[slides](https://rsa-tools.github.io/course/pdf_files/01-2_regulatory_sequences_intro.pdf)] |
| Position-specific scoring matrices (PSSM) | [[slides](https://rsa-tools.github.io/course/pdf_files/01-4_PSSM_theory.pdf)] |
| Sequence models (Bernoulli, Markov chains) | [[slides](https://rsa-tools.github.io/course/pdf_files/01-3_sequence_models.pdf)] |
| Matrix-based pattern matching | [[slides](https://rsa-tools.github.io/course/pdf_files/02-3_pattern_matching_matrices.pdf)] |


<!--
| **Exercises:** scaning sequences with a reference motif |  [[html](practicals/motif_search_RegulonDB/motif_search_RegulonDB.html)] [[Rmd](https://raw.githubusercontent.com/jvanheld/LCG_BEII/gh-pages/practicals/motif_search_RegulonDB/motif_search_RegulonDB.Rmd)]  |
| **Solutions** scaning sequences with a reference motif |  [[html](practicals/motif_search_RegulonDB/motif_search_RegulonDB_solutions.html)] [[Rmd](https://raw.githubusercontent.com/jvanheld/LCG_BEII/gh-pages/practicals/motif_search_RegulonDB/motif_search_RegulonDB_solutions.Rmd)] | 
-->

### Motif discovery (day 3)

| Topics                                                | Supports |
|-------------------------------------------------------|----------|
| Introduction to motif discovery |  [[slides](http://rsa-tools.github.io/course/pdf_files/03-1_pattern_discovery_intro.pdf)] |
| String-based pattern discovery | [[slides](http://rsa-tools.github.io/course/pdf_files/03-2-1_pattern_discovery_strings.pdf)] |
| **Tutorial:** motif discovery in promoters of yeast regulons | [[tutorial](practicals/motif_discovery/motif_discovery_yeast_regulons.html)]
| **Exercise:** discovering a motif discovery algorithm | [[html](practicals/motif_discovery/discovering_a_motif_discovery_algorithm.html)] [[pdf](practicals/motif_discovery/discovering_a_motif_discovery_algorithm.pdf)] [[Rmd](https://raw.githubusercontent.com/jvanheld/LCG_BEII/gh-pages/practicals/motif_discovery/discovering_a_motif_discovery_algorithm.Rmd)] |

### ChIP-seq analysis (day 4)

| Topics                                                | Supports |
|-------------------------------------------------------|----------|
| Slides: ChIP-seq technology + motif discovery | [[pdf](slides/ChIP-seq_compilation.pdf)]|
| Practical: analyzing ChIP-seq peaks | [[html](practicals/chip-seq_analysis/chip-seq_analysis.html)] [[Rmd](https://raw.githubusercontent.com/jvanheld/LCG_BEII/gh-pages/practicals/chip-seq_analysis/chip-seq_analysis.Rmd)] |


## Resources

| Name   | Description + URL |
|------------------|-----------------------------------------------|
| RSAT | Regulatory sequence analysis tools: <http://rsat.eu/> |
| RegulonDB | Transcription factor database: <http://regulondb.ccg.unam.mx/> |
| RSAT course | Teaching material about the analysis of regulatory sequences <http://rsa-tools.github.io/course/> |
| JASPAR | Open-access database for eukaryotic transcription factor binding profiles: <https://jaspar.genereg.net> |
| ReMap | Catalogues of TF binding peaks obtained with high-throughput methods (ChIP-seq, ChIP-exo, DAP-seq) for *Homo sapiens*, *Mus musculus* and *Drosophila melanogaster*: <https://remap.univ-amu.fr/> |
| Classification performance indicators | [Confusion matrix](https://en.wikipedia.org/wiki/Confusion_matrix), [Sensitivity and specificity](https://en.wikipedia.org/wiki/Sensitivity_and_specificity)|

<!--
| ChIP-seq tutorial | Tutorial on chip-seq analysis written by Morgane Thomas-Chollier, from which I used the FNR dataset used in this course <http://www.biologie.ens.fr/~mthomas/other/chip-seq-training/> |
| Stats4bioinfo | Supporting site for an introductory course about statistics for bioingormatics  <http://pedagogix-tagc.univ-mrs.fr/courses/statistics_bioinformatics/> |
|  AVIESAN NGS ChIP-seq course |  [http://jvanheld.github.io/EBA15\_stats\_RStudio/](http://jvanheld.github.io/stats_avec_RStudio_EBA/) |
-->

### Support and contact

<Jacques.van-Helden@univ-amu.fr>

****************************************************************
