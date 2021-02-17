.PHONY : htmls website clean leandocs

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


leandocs :
	rm -rf igl2020-docs
	git branch -D lean-doc
	git branch --track lean-doc origin/lean-doc
	git checkout lean-doc -- igl2020-docs
	git add igl2020-docs/
	git commit -m "auto-update lean documentation for igl2020"
	git push origin master

clean :
	rm -f index.html
