################################################################
## Test makefile


all: hello hello

hello:
	@echo "HELLO"

bye:
	@echo "BYE"

whoami:
	@whoami

TF=AraC
param:
	@echo "Parameters"
	@echo "	TF		${TF}"

RESULT_DIR=results/${TF}
dir:
	@echo "Creating result directory"
	@mkdir -p ${RESULT_DIR}
	@echo "	RESULT_DIR		${RESULT_DIR}"

