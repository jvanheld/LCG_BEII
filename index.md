# Analysis of regulatory sequences (UNAM LCG BE-II)

This site contains the support for the courses  taught by Jacques van Helden to 2nd year students of the
Licenciatura en Ciencias Genomicas de la Universidad Nacional Autonoma
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
- [Download **ZIP File**](https://github.com/jvanheld/LCG_Bioinfo-II/zipball/master)
- [Download **TARBall**](https://github.com/jvanheld/LCG_Bioinfo-II/tarball/master)
- [View On **GitHub**](https://github.com/jvanheld/LCG_Bioinfo-II)

## Scope of the course

This Web site contains the teaching material for a 1-week course taught
by Jacques van Helden to 2nd year\'s students of the Licenciatura en
Ciencias Genomicas (LCG) of the Universidad Nacional Autonoma de Mexico
(UNAM).

The goal of the course is to introduce bioinformatics and statistical
methods to analyse gene regulation based on Next Generation Sequencing
data.

## Keywords

-   Next Generation Sequencing (NGS)
-   Regulatory Sequence Analysis Tools (RSAT)
-   Bioinformatics
-   Statistics
-   Genomics
-   ChIP-seq

## Authors and Contributors

Jacques van Helden\
Institut Français de Bioinformatique (IFB).\
Aix-Marseille Université (AMU).\
Lab. Theory and Approaches of Genome Complexity (TAGC)\
Web: <http://jacques.van-helden.perso.luminy.univ-amu.fr/>\
Email: <Jacques.van-Helden@univ-amu.fr>

****************************************************************
## Teaching material

### Day 1: from TF binding sites to motifs and back


| Topics                                                | Supports |
|-------------------------------------------------------|----------|
| Introduction to the course | [[slides](slides/01_course-intro-contents.html)]
| Transcriptional regulation | [[slides](http://rsa-tools.github.io/course/pdf_files/01.2_regulatory_sequences_intro.pdf)] |
| Position-specific scoring matrices (PSSM) | [[slides](http://rsa-tools.github.io/course/pdf_files/01.4.PSSM_theory.pdf)] |
| Sequence models (Bernoulli, Markov chains) | [[slides](http://rsa-tools.github.io/course/pdf_files/01.3.sequence_models.pdf)] |
| Matrix-based pattern matching | [[slides](http://rsa-tools.github.io/course/pdf_files/02.3.pattern_matching_matrices.pdf)] |

### Day 2: practical: scanning sequences with motifs

| Topics                                                | Supports |
|-------------------------------------------------------|----------|
| **Exercise:** scaning sequences with a reference motif |  [[exercise](practicals/motif_search_RegulonDB/motif_search_RegulonDB.html)] | |

  
### Day 3: motif discovery

| Topics                                                | Supports |
|-------------------------------------------------------|----------|
| Introduction to motif discovery |  [[slides](http://rsa-tools.github.io/course/pdf_files/03.1.pattern_discovery_intro.pdf)] |
| String-based pattern discovery | [[slides](http://rsa-tools.github.io/course/pdf_files/03.2.1.pattern_discovery_strings.pdf)] |
| **Tutorial:** mlotif discovery in promoters of yeast regulons | [[tutorial](practicals/motif_discovery/motif_discovery_yeast_regulons.html)]
| **Exercise:** discovering a motif discovery algorithm | [[html](practicals/motif_discovery/discovering_a_motif_discovery_algorithm.html)] [[pdf](practicals/motif_discovery/discovering_a_motif_discovery_algorithm.pdf)] [[Rmd](https://raw.githubusercontent.com/jvanheld/LCG_BEII/gh-pages/practicals/motif_discovery/discovering_a_motif_discovery_algorithm.Rmd)] |

### Day 4: ChIP-seq analysis

| Topics                                                | Supports |
|-------------------------------------------------------|----------|
| Slides: ChIP-seq technology + motif discovery | [[pdf](slides/ChIP-seq_compilation.pdf)]|
| Practical: analyzing ChIP-seq peaks | [[html](practicals/chip-seq_analysis/chip-seq_analysis.html)] [[Rmd](https://raw.githubusercontent.com/jvanheld/LCG_BEII/gh-pages/practicals/chip-seq_analysis/chip-seq_analysis.Rmd)] |

## Resources

| Name   | Description + URL |
|------------------|-----------------------------------------------|
| RSAT | Regulatory sequence analysis tools: <http://rsat.eu/> |
| RSAT course | Teaching material about the analysis of regulatory sequences <http://rsa-tools.github.io/course/> |
| ChIP-seq tutorial | Tutorial on chip-seq analysis written by Morgane Thomas-Chollier, from which I used the FNR dataset used in this course <http://www.biologie.ens.fr/~mthomas/other/chip-seq-training/> |
| Stats4bioinfo | Supporting site for an introductory course about statistics for bioingormatics  <http://pedagogix-tagc.univ-mrs.fr/courses/statistics_bioinformatics/> |
|  AVIESAN NGS ChIP-seq course |  [http://jvanheld.github.io/EBA15\_stats\_RStudio/](http://jvanheld.github.io/stats_avec_RStudio_EBA/) |


### Support or Contact

<Jacques.van-Helden@univ-amu.fr>

****************************************************************
