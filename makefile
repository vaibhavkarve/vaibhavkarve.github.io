.PHONY : clean

index.html : org/index.org
	touch org/*.org
	emacs -l org_publish.el --batch $< -f org-publish-all --kill

clean :
	rm -f index.html
