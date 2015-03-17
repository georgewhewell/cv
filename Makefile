all: george_whewell_cv.pdf 

george_whewell_cv.pdf:
	xelatex george_whewell_cv.tex

deps:
	tlmgr install datetime fmtcount etoolbox

.PHONY: deps