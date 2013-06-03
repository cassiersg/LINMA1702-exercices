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
SRC=$(MAIN_NAME).tex 1.tex 2.tex 3.tex 4.tex 5.tex 6.tex 7.tex

# If you want the pdf to be opened by your preferred pdf viewer
# after `$ make', comment the following line and uncomment the
# line after
#default: all
default: show

all: $(MAIN_NAME).$(EXT)

$(MAIN_NAME).$(EXT): $(SRC)
	pdflatex -shell-escape -enable-write18 $(MAIN_NAME).tex

clean:
	$(RM) *.aux *.log *.out *.toc

show: $(MAIN_NAME).$(EXT)
	$(PDFVIEWER) $(MAIN_NAME).$(EXT) 2> /dev/null &

release: $(MAIN_NAME).$(EXT)
	./update_dropbox.sh
