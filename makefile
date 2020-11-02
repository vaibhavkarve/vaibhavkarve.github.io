.PHONY : htmls website clean

htmls : org/index.org
	touch org/*.org
	emacs -l org_publish.el --batch $< --eval="(org-publish-all (symbol-name 'org))" --kill

website : htmls
	git add .
	git commit -m "auto-update webpages"
	git push origin master

org/CV.pdf : ~/org/ref/cv_november_2020/CV.pdf
	cp $< $@

clean :
	rm -f index.html
