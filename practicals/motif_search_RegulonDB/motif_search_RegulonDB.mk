################################################################
## Solutions of the practical Scanning non-coding sequences with a TFBM

targets:
	@echo "Target list"
	@echo "	param		list parameters"
	@echo "	data_from_rdb	download reference data sets from RegulonDB"

################################################################
## DEfine general parameters
ORG=Escherichia_coli_GCF_000005845.2_ASM584v2
TF=LexA
param:
	@echo "Parameters"
	@echo "	ORG		${ORG}"
	@echo "	TF		${TF}"


REF_SITES=${TF}_RDN_sites.tsv
data_from_rdb:
	@echo "Downloading reference sites from RegulonDB"
#	wget --no-clobber --output-file ${REF_SITES}  'http://regulondb.ccg.unam.mx/webresources/tools/getTFBS?tfObject=LexA'
	wget --no-clobber --output-file=${REF_SITES}  'http://regulondb.ccg.unam.mx/webresources/tools/getTFBS?tfObject=LexA'
	@echo "	REF_SITES	${REF_SITES}"



