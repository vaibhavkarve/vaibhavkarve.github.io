.PHONY : htmls website clean leandocs

htmls : org/index.org
	touch org/*.org
	emacs -l org_publish.el --batch $< --eval="(org-publish-all (symbol-name 'org))" --kill

website : htmls pdf-docs
	git add .
	git commit -m "auto-update webpages"
	git push origin master


pdf-docs : ~/org/ref/cv_may_2021/CV.pdf
	cp ~/org/ref/cv_may_2021/CV.pdf org/CV.pdf
#cp ~/talks/2021_04_08_phd/main.pdf org/satisfiability/slides.pdf
#cp ~/hirani_group/home/papers/theses/vaibhav/main.pdf org/satisfiability/thesis.pdf || true


org/Teaching_Philosophy_Statement.pdf : ~/org/ref/teaching_statement_jan_2021/teaching_statement_jan_2021.pdf
	cp $< $@


leandocs :
	rm -rf igl2020-docs
	git branch -D lean-doc || true
	git branch --track lean-doc origin/lean-doc
	git checkout lean-doc
	git pull
	git checkout master
	git checkout lean-doc -- igl2020-docs
	git add igl2020-docs/
	git commit -m "auto-update lean documentation for igl2020"
	git push origin master

clean :
	rm -f index.html
