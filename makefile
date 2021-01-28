.PHONY : htmls website clean

htmls : org/index.org
	touch org/*.org
	emacs -l org_publish.el --batch $< --eval="(org-publish-all (symbol-name 'org))" --kill

website : htmls
	git add .
	git commit -m "auto-update webpages"
	git push origin master

org/CV.pdf : ~/org/ref/cv_jan_2021/CV.pdf
	cp $< $@

org/Teaching_Philosophy_Statement.pdf : ~/org/ref/teaching_statement_jan_2021/teaching_statement_jan_2021.pdf
	cp $< $@


clean :
	rm -f index.html
