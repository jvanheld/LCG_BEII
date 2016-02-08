################################################################
## 

usage:
	@echo "Supported targets"
	@echo "	web	open the public Web site of the course."
	@echo "	local	open the local version of the course (index.html)"
	@echo

local:
	@open index.html 

WEB=http://jvanheld.github.io/LCG_BEII
web:
	@echo ${WEB}
	@open ${WEB}
