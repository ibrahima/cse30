%.pdf : %.md src/*.c head.tex
	gpp -T $< | pandoc -t beamer -o $@ -H head.tex

%.tex : %.md head.tex
	gpp -T $< -o $*.tmp.md
	pandoc $*.tmp.md -s -R -t beamer -o $@ -H head.tex

all: disc4.pdf

tex: disc4.tex

clean:
	rm disc4.pdf
