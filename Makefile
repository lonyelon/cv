# Build spanish CV.
es: main.tex
	pdflatex --jobname=cv_es main.tex

# Clean all the files.
clean:
	rm cv_es.aux  cv_es.log  cv_es.out  cv_es.pdf
