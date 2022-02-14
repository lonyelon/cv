# Build spanish CV.
es: main.tex
	pdflatex --jobname=cv_es '\def\eslang{1}\input{main.tex}'

# Build english CV.
en: main.tex
	pdflatex --jobname=cv_en main.tex

# Clean all the files.
clean:
	rm cv_es.aux cv_es.log cv_es.out cv_es.pdf
	rm cv_en.aux cv_en.log cv_en.out cv_en.pdf
