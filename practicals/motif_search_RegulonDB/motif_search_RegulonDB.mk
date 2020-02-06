###############################################################
## Solutions of the practical Scanning non-coding sequences with a TFBM

targets:
	grep -pe '^\w*:' makefile | perl -pe 's|:.*| |'

help:
	@echo "Target list"
	@echo "	param			list parameters"
	@echo "	dir			create output directory"
	@echo "	ref_sites		download reference sites from RegulonDB"
	@echo "	ref_pssm		download reference position-specific scoring matrix from RegulonDB"
	@echo "	ref_genes		download reference target genes from RegulonDB"
	@echo "	deg_consensus		compute degenerate consensus from reference PSSM"
	@echo "	all_seq			retrieve all upstream sequences"
	@echo "	tfbs_vs_consensus	scan annotated TFBSs with degenerate consensus"

################################################################
## DEfine general parameters
V=1
ORG=Escherichia_coli_GCF_000005845.2_ASM584v2
TF=AraC
MARKOV=1
RESULT_DIR=results/${TF}
PVAL=0.0001
SITE_EXT=10
param:
	@echo "Parameters"
	@echo "	V		${V}"
	@echo "	ORG		${ORG}"
	@echo "	TF		${TF}"
	@echo "	SITE_EXT		${SITE_EXT}"
	@echo "	MARKOV		${MARKOV}"
	@echo "	PVAL		${PVAL}"

summary:
	@echo "Result files and summary"
	@echo "	RESULT_DIR			${RESULT_DIR}"
	@echo "	REF_SITES			${REF_SITES}"
	@echo "	ALLUP				${ALLUP}"
	@echo "	REF_SITES_NB			${REF_SITES_NB}"
	@echo "	REF_PSSM			${REF_PSSM}"
	@echo "	REF_GENES			${REF_GENES}"
	@echo "	REF_GENE_NB			${REF_GENE_NB}"
	@echo "	DEG_CONSENSUS			${DEG_CONSENSUS}"
	@echo "	TFBS_VS_CONSENSUS		${TFBS_VS_CONSENSUS}"
	@echo "	TFBS_VS_CONSENSUS_GENES		${TFBS_VS_CONSENSUS_GENES}"
	@echo "	CONS_RECOVERED_SITES_NB		${CONS_RECOVERED_SITES_NB}"
	@echo "	CONS_RECOVERED_GENES_NB		${CONS_RECOVERED_GENES_NB}"
	@echo "	ALLUP_VS_CONSENSUS		${ALLUP_VS_CONSENSUS}"
	@echo "	ALLUP_VS_CONSENSUS_GENES	${ALLUP_VS_CONSENSUS_GENES}"
	@echo "	CONS_ALLUP_SITES_NB		${CONS_ALLUP_SITES_NB}"
	@echo "	CONS_ALLUP_GENES_NB		${CONS_ALLUP_GENES_NB}"
	@echo "	BG_FILE				${BG_FILE}"
	@echo "	TFBS_VS_PSSM			${TFBS_VS_PSSM}"
	@echo "	PSSM_RECOVERED_SITES_NB		${PSSM_RECOVERED_SITES_NB}"


all: dir ref_sites ref_pssm ref_genes deg_consensus all_seq tfbs_vs_consensus allup_vs_consensus create_bg tfbs_vs_pssm summary

dir:
	mkdir -p ${RESULT_DIR}
	@echo "	RESULT_DIR	${RESULT_DIR}"

################################################################
## Get reference TFBS from RegulonDB
REF_SITES=${RESULT_DIR}/${TF}_RegulonDB_sites_ext${SITE_EXT}.fasta
REF_SITES_NB=`grep '^>' ${REF_SITES} | wc -l | awk '{print $$1}'`
ref_sites:
	@echo "Downloading reference sites from RegulonDB"
	curl 'http://regulondb.ccg.unam.mx/webresources/tools/getTFBS?tfObject=${TF}&extended=${SITE_EXT}' | grep -v '^#' > ${REF_SITES}
	@echo "	REF_SITES	${REF_SITES}"


################################################################
## Get reference PSSM from RegulonDB
REF_PSSM=${RESULT_DIR}/${TF}_RegulonDB_PSSM.tab
ref_pssm:
	@echo "Downloading reference PSSM from RegulonDB"
	curl 'http://regulondb.ccg.unam.mx/webresources/tools/getPSSM?tfObject=${TF}' | grep -v '^#' > ${REF_PSSM}
	@echo "	REF_PSSM	${REF_PSSM}"

################################################################
## Get annotated target genes from RegulonDB
REF_GENES=${RESULT_DIR}/${TF}_RegulonDB_genes.tab
REF_GENE_NB=`wc -l ${REF_GENES} | awk '{print $$1}'`
ref_genes:
	@echo "Downloading annotated target genes from RegulonDB"
	curl 'http://regulondb.ccg.unam.mx/webresources/regulon/getRegulatedGenes?tfObject=${TF}' > ${REF_GENES} 
	@echo "	REF_GENES	${REF_GENES}"
	@echo "	REF_GENE_NB	${REF_GENE_NB}"

################################################################
## Compute the degenerate consensus from the PSSM
DEG_CONSENSUS=${RESULT_DIR}/${TF}_RegulonDB_consensus.tab
deg_consensus:
	@echo "Computing degenerate consensus from reference PSSM"
	convert-matrix -v ${V} -i ${REF_PSSM} -from tab -to tab -return consensus | grep '^; consensus\t' | cut -f 2 > ${DEG_CONSENSUS}
	@echo "	DEG_CONSENSUS	${DEG_CONSENSUS}"
	@echo "		`cat ${DEG_CONSENSUS}`"

################################################################
## Retrieving all the upstream sequences
ALLUP=${RESULT_DIR}/${ORG}_all_upstream-noorf.fasta
all_seq:
	@echo "Retrieving all the upstream sequences"
	retrieve-seq -org ${ORG} -from -1 -to -400 -noorf -all -label name -o ${ALLUP}
	@echo "	${ALLUP}"

################################################################
## Use dna-pattern to scan the annotated binding sites with the degenerate consensus.
TFBS_VS_CONSENSUS=${RESULT_DIR}/TFBS_matches_with_deg-consensus_${TF}.ft
CONS_RECOVERED_SITES_NB=`grep -v '^;' ${TFBS_VS_CONSENSUS} | wc -l | awk '{print $$1}'`
TFBS_VS_CONSENSUS_GENES=${RESULT_DIR}/TFBS_matches_with_deg-consensus_${TF}_genes.txt
CONS_RECOVERED_GENES_NB=`wc -l ${TFBS_VS_CONSENSUS_GENES} | awk '{print $$1}'`
tfbs_vs_consensus:
	@echo "Scanning annotated binding sites with degenerate consensus"
	dna-pattern -v ${V} -i ${REF_SITES} -pl ${DEG_CONSENSUS} -o ${TFBS_VS_CONSENSUS}
	@echo "	TFBS_VS_CONSENSUS	${TFBS_VS_CONSENSUS}"
	grep -v '^;' ${TFBS_VS_CONSENSUS} | cut -f 4 | sort -u > ${TFBS_VS_CONSENSUS_GENES}
	@echo "	TFBS_VS_CONSENSUS_GENES	${TFBS_VS_CONSENSUS_GENES}"
	@echo "	CONS_RECOVERED_SITES_NB	${CONS_RECOVERED_SITES_NB}"
	@echo "	CONS_RECOVERED_GENES_NB	${CONS_RECOVERED_GENES_NB}"

################################################################
## Use dna-pattern to scan all promoters with the degenerate consensus.
ALLUP_VS_CONSENSUS=${RESULT_DIR}/ALLUP_matches_with_deg-consensus_${TF}.ft
ALLUP_VS_CONSENSUS_GENES=${RESULT_DIR}/ALLUP_matches_with_deg-consensus_${TF}_genes.txt
CONS_ALLUP_SITES_NB=`grep -v '^;' ${ALLUP_VS_CONSENSUS} | wc -l | awk '{print $$1}'`
CONS_ALLUP_GENES_NB=`wc -l ${ALLUP_VS_CONSENSUS_GENES} | awk '{print $$1}'`
allup_vs_consensus:
	@echo "Scanning annotated binding sites with degenerate consensus"
	dna-pattern -v ${V} -i ${ALLUP} -pl ${DEG_CONSENSUS} -o ${ALLUP_VS_CONSENSUS}
	@echo "	ALLUP_VS_CONSENSUS	${ALLUP_VS_CONSENSUS}"
	grep -v '^;' ${ALLUP_VS_CONSENSUS} | cut -f 4 | sort -u > ${ALLUP_VS_CONSENSUS_GENES}
	@echo "	ALLUP_VS_CONSENSUS_GENES	${ALLUP_VS_CONSENSUS_GENES}"
	@echo "	CONS_ALLUP_SITES_NB		${CONS_ALLUP_SITES_NB}"
	@echo "	CONS_ALLUP_GENES_NB		${CONS_ALLUP_GENES_NB}"

################################################################
## Create background model from all upstream sequences
BG_FILE=${RESULT_DIR}/${ORG}_allup-noorf_bg_markov${MARKOV}.tab
create_bg:
	@echo "Creating background model from all upstream sequences"
	create-background-model -v ${V} -i ${ALLUP} -markov 1 -o ${BG_FILE}
	@echo "	BG_FILE			${BG_FILE}"

################################################################
## Use *matrix-scan* to scan the annotated binding sites with a PSSM
TFBS_VS_PSSM=${RESULT_DIR}/TFBS_matches_PSSM_${TF}_pval${PVAL}.ft
TFBS_VS_PSSM_GENES=${RESULT_DIR}/TFBS_matches_with_PSSM_${TF}_genes.txt
PSSM_RECOVERED_SITES_NB=`grep -v '^;' ${TFBS_VS_PSSM} | wc -l | awk '{print $$1}'`
PSSM_RECOVERED_GENES_NB=`wc -l ${TFBS_VS_PSSM_GENES} | awk '{print $$1}'`
tfbs_vs_pssm:
	@echo "Scanning annotated binding sites with PSSM"
	matrix-scan -v ${V} \
		-i ${REF_SITES} \
		-seq_format fasta \
		-matrix_format tab -m ${REF_PSSM} \
		-bgfile ${BG_FILE} \
		-pseudo 1 \
		-decimals 1 \
		-2str \
		-origin end \
		-bgfile ${BG_FILE} \
		-bg_format oligos \
		-bg_pseudo 0.01 \
		-return sites \
		-return pval \
		-uth pval ${PVAL}  \
		-n score \
		-o ${TFBS_VS_PSSM}
	@echo "	TFBS_VS_PSSM	${TFBS_VS_PSSM}"
	grep -v '^;' ${TFBS_VS_PSSM} | cut -f 4 | sort -u > ${TFBS_VS_PSSM_GENES}
	@echo "	TFBS_VS_PSSM_GENES	${TFBS_VS_PSSM_GENES}"
	@echo "	PSSM_RECOVERED_SITES_NB	${PSSM_RECOVERED_SITES_NB}"
	@echo "	PSSM_RECOVERED_GENES_NB	${PSSM_RECOVERED_GENES_NB}"

################################################################
## Use *matrix-scan* to scan the annotated binding sites with a PSSM
ALLUP_VS_PSSM=${RESULT_DIR}/ALLUP_matches_PSSM_${TF}.ft
ALLUP_VS_PSSM_GENES=${RESULT_DIR}/ALLUP_matches_with_PSSM_${TF}_genes.txt
PSSM_ALLUP_SITES_NB=`grep -v '^;' ${ALLUP_VS_PSSM} | wc -l | awk '{print $$1}'`
PSSM_RECOVERED_GENES_NB=`wc -l ${ALLUP_VS_PSSM_GENES} | awk '{print $$1}'`
allup_vs_pssm:
	@echo "Scanning annotated binding sites with PSSM"
	matrix-scan -v ${V} \
		-i ${ALLUP} \
		-matrix_format tab -m ${REF_PSSM} \
		-bgfile ${BG_FILE} \
		-pseudo 1 \
		-decimals 1 \
		-2str \
		-origin end \
		-bgfile ${BG_FILE} \
		-bg_pseudo 0.01 \
		-return sites \
		-return pval \
		-lth score 1  \
		-uth pval 1e-4  \
		-seq_format fasta \
		-n score \
		-o ${ALLUP_VS_PSSM}
	@echo "	ALLUP_VS_PSSM	${ALLUP_VS_PSSM}"
	grep -v '^;' ${ALLUP_VS_PSSM} | cut -f 4 | sort -u > ${ALLUP_VS_PSSM_GENES}
	@echo "	ALLUP_VS_PSSM_GENES	${ALLUP_VS_PSSM_GENES}"
	@echo "	PSSM_SITES_NB	${PSSM_SITES_NB}"
	@echo "	PSSM_GENES_NB	${PSSM_GENES_NB}"
