%.pdf : %.md src/*.c head.tex
	gpp -T $< | pandoc -t beamer -o $@ -H head.tex

%.tex : %.md head.tex
	gpp -T $< -o $*.tmp.md
	pandoc $*.tmp.md -s -R -t beamer -o $@ -H head.tex

all: disc5.pdf

tex: disc5.tex

clean:
	rm disc5.pdf
