#######################################
# ceerious markdown converter makefile
#######################################

# define template to use for generating PDF
# If it is empty default.latex from pandoc intall is used.
PDFTEMPLATE=gibs.latex
PDFDIR=pdf/
MDDIR=md/
RMDDIR=rmd/
FIGDIR=figure/

# define variables to be used for LATEX
# http://pandoc.org/README#variables-for-latex
LVAR= \
	classoption=oneside \
	geometry=a4paper \
	geometry=margin=21mm \
	links-as-notes=true \

# to future me:
# do not touch unless you are sure what you do.
RMDS=$(wildcard $(RMDDIR)*.rmd)
MDS=$(RMDS:$(RMDDIR)%.rmd=$(MDDIR)%.md)
PDFS=$(MDS:$(MDDIR)%.md=$(PDFDIR)%.pdf)
VARS = $(foreach arg,$(LVAR),--variable $(arg))

all: $(MDS) $(PDFS)

# create a proper md file from Rmarkdown files with integrated R snippets
# $< = source file
# $@ = target file
$(MDDIR)%.md: $(RMDDIR)%.rmd
	@mkdir -p $(MDDIR)
	@echo knitting R within markdown file $<
	@echo $< $@
	@R --quiet -e "library(knitr);knit('$<', '$@')"
	@echo ---

# create pdf from every md file in MDDIR
$(PDFDIR)%.pdf : $(MDDIR)%.md
	@mkdir -p $(PDFDIR)
	@echo converting $< to $@ using:
	pandoc --template=$(PDFTEMPLATE) $(VARS) $< -o $@
	@echo ---

# remove generated pdf output files if they exist
clean:
	@$(foreach file,$(PDFS),if [ -f $(file) ]; then rm $(file); fi;)

# remove generated markdown files
clean-md:
	@$(foreach file,$(MDS),if [ -f $(file) ]; then rm $(file); fi;)

# remove generated markdown files
clean-fig:
	@rm $(FIGDIR)/*

clean-all:
	clean
	clean-md
	clean-fig

rebuild: clean-all all

.phony: clean clean-md clean-fig clean-all
