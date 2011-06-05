# Makefile

# Get all tex files
TEX_FILES = $(wildcard *.tex)

all: dvi pdf rm_aux
	@echo "Done!"

dvi: *.tex
	@echo "Creating dvi files... $^"
	@$(foreach var,$(TEX_FILES),latex -interaction=nonstopmode '$(var)' 1>/dev/null;)

pdf: *.tex
	@echo "Creating pdf files... $^"
	@$(foreach var,$(TEX_FILES),pdflatex -interaction=nonstopmode '$(var)' 1>/dev/null;)

delivery: $(TARGET).tex
	@echo "Creating pdf file... CV_EduardoBallesteros.pdf from $^"
	@pdflatex -interaction=nonstopmode '$^' 1>/dev/null;
	@mv `basename $^ .tex`.pdf CV_EduardoBallesteros.pdf
	@rm *.aux *.log *.out

rm_aux:
	@echo "Removing unneeded files..."
	@rm *.aux *.log *.out

clean:
	@rm -f *.aux *.dvi *.log *.out *.pdf *.bak
	@echo "Cleaning... done!";

