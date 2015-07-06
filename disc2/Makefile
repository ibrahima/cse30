%.pdf : %.md src/*.c
	gpp -T $< | pandoc -t beamer -o $@ -H head.tex

%.tex : %.md
	gpp -T $< -o $*.tmp.md
	pandoc $*.tmp.md -s -R -t beamer -o $@ -H head.tex

all: disc2.pdf

tex: disc2.tex

clean:
	rm disc2.pdf
