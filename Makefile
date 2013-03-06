# You can change the pdf viewer to your preferred
# one by commenting every line beginning by
# `PDFVIEWER' except the one with your pdf viewer
#PDFVIEWER=evince # GNOME
#PDFVIEWER=okular # KDE
#PDFVIEWER=xpdf # lightweight
PDFVIEWER=xdg-open # Default pdf viewer - GNU/Linux
#PDFVIEWER=open # Default pdf viewer - Mac OS
MAIN_NAME=LINMA1702-exercices
EXT=pdf
PDF_NAME=$(MAIN_NAME).$(EXT)

# If you want the pdf to be opened by your preferred pdf viewer
# after `$ make', comment the following line and uncomment the
# line after
#default: all
default: show

all: $(MAIN_NAME).$(EXT)

$(MAIN_NAME).$(EXT): $(MAIN_NAME).tex
	pdflatex -shell-escape -enable-write18 $(MAIN_NAME).tex

clean:
	$(RM) *.aux *.log *.out *.toc

show: $(MAIN_NAME).$(EXT)
	$(PDFVIEWER) $(MAIN_NAME).$(EXT) 2> /dev/null &
