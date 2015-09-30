%.pdf : %.md src/*.c head.tex
	gpp -T $< | pandoc -t beamer -o $@ -H head.tex

%.tex : %.md head.tex
	gpp -T $< -o $*.tmp.md
	pandoc $*.tmp.md -s -R -t beamer -o $@ -H head.tex

all: disc1.pdf

tex: disc1.tex

clean:
	rm disc1.pdf
