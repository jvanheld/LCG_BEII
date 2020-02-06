################################################################
## Analysis of a ChIP-seq dataset


targets:
	@echo "Targets"
	@echo "	param			list parameters"
	@echo "	dir			create result directory"
	@echo "	download_peaks		download peaks from ReMap" 
	@echo "	download_matrices	download reference matrices from JASPAR and Hocomoco" 

TF=SOX2
CELL_TISSUE=hESC
GSE=GSE69479
PREFIX=${TF}_${CELL_TISSUE}_${GSE}
PEAK_FILE=${GSE}.${TF}.${CELL_TISSUE}_peaks.narrowPeak.gz
PEAK_URL=http://remap.univ-amu.fr/storage/remap2020/hg38/MACS2/DATASET/${GSE}.${TF}.${CELL_TISSUE}/macs2/${PEAK_FILE}
param:
	@echo "Parameters"
	@echo "	TF			${TF}"
	@echo "	CELL_TISSUE		${CELL_TISSUE}"
	@echo "	GSE			${GSE}"
	@echo "	PREFIX			${PREFIX}"
	@echo "	RESULT_DIR		${RESULT_DIR}"
	@echo "	PEAK_FILE		${PEAK_FILE}"
	@echo "	PEAK_URL		${PEAK_URL}"
	@echo "	PEAKS			${PEAKS}"
	@echo "	PSSM_DIR		${PSSM_DIR}"
	@echo "	JASPAR_MATRIX		${JASPAR_MATRIX}"

RESULT_DIR=~/LCG_BEII/chip-seq_practical/${PREFIX}
dir:
	@echo "Creating result directory"
	mkdir -p ${RESULT_DIR}
	@echo "	RESULT_DIR	${RESULT_DIR}"

PEAKS=${RESULT_DIR}/${PEAK_FILE}
download_peaks:
	@echo "Downloading peaks from ReMap"
	(cd ${RESULT_DIR}; wget --no-clobber ${PEAK_URL})
	@echo "	PEAKS	${PEAKS}"

PSSM_DIR=${RESULT_DIR}/${TF}
REF_MOTIFS=${TF}_reference-motifs.tf
JASPAR_MATRIX=MA0143.1.transfac
JASPAR_URL=http://jaspar.genereg.net/api/v1/matrix/${JASPAR_MATRIX}
HOCOMOCO_MATRIX=SOX2_HUMAN.H11MO.1.A.pcm
HOCOMOCO_URL=http://hocomoco11.autosome.ru/final_bundle/hocomoco11/full/HUMAN/mono/pcm/${HOCOMOCO_MATRIX}
download_matrices:
	@echo "Downloading reference matrices"
	@mkdir -p ${PSSM_DIR}
	@echo "	PSSM_DIR		${PSSM_DIR}"
	(cd ${PSSM_DIR}; wget --no-clobber ${JASPAR_URL})
	@echo "	JASPAR_URL		${JASPAR_URL}"
	@echo "	JASPAR_MATRIX		${JASPAR_MATRIX}"
	(cd ${PSSM_DIR}; wget --no-clobber ${HOCOMOCO_URL})
	@echo "	HOCOMOCO_URL		${HOCOMOCO_URL}"
	@echo "	HOCOMOCO_MATRIX		${HOCOMOCO_MATRIX}"
	convert-matrix -i ${PSSM_DIR}/${HOCOMOCO_MATRIX} \
		-from cluster-buster -to transfac \
		-o ${PSSM_DIR}/${HOCOMOCO_MATRIX}.tf
	@echo "	${PSSM_DIR}/${HOCOMOCO_MATRIX}.tf"
	(cd ${PSSM_DIR}; cat ${JASPAR_MATRIX} ${HOCOMOCO_MATRIX}.tf > ${REF_MOTIFS})
	@echo "	REF_MOTIFS		${PSSM_DIR}/${REF_MOTIFS}"

peakmo:
	peak-motifs  -v 1 \
		-title GSE69479.SOX2.hESC_peaks.narrowPeak.gz_f0jd_20200206_174109.gz \
		-i $RSAT/public_html/tmp/apache/2020/02/06/peak-motifs.2020-02-06.175552_2020-02-06.175552_GkdPO3/peak-motifspeak_seq \
		-max_seq_len 1000 \
		-markov auto \
		-disco oligos,positions \
		-nmotifs 5 \
		-minol 6 \
		-maxol 7 \
		-no_merge_lengths \
		-2str \
		-origin center \
		-motif_db Hocomoco_human tf $RSAT/public_html/motif_databases/HOCOMOCO/HOCOMOCO_2017-10-17_Human.tf \
		-motif_db jaspar_core_nonredundant_vertebrates tf $RSAT/public_html/motif_databases/JASPAR/Jaspar_2020/nonredundant/JASPAR2020_CORE_vertebrates_non-redundant_pfms.tf \
		-ref_motifs $RSAT/public_html/tmp/apache/2020/02/06/peak-motifs.2020-02-06.175552_2020-02-06.175552_GkdPO3/peak-motifs_ref_motifs.tf \
		-scan_markov 1 \
		-task purge,seqlen,composition,disco,merge_motifs,split_motifs,motifs_vs_motifs,timelog,archive,synthesis,small_summary,motifs_vs_db,ref_motifs,motifs_vs_ref,scan \
		-prefix peak-motifs \
		-noov \
		-img_format png \
		-outdir $RSAT/public_html/tmp/apache/2020/02/06/peak-motifs.2020-02-06.175552_2020-02-06.175552_GkdPO3
