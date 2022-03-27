# Files and Constants
# ===================

cv_source := "~/org/ref/cv_march_2022/CV.pdf"
cv_sink := "org/CV.pdf"
teaching_statement_source := "~/org/ref/teaching_statement_jan_2021/teaching_statement_jan_2021.pdf"
teaching_statement_sink := "org/Teaching_Philosophy_Statement.pdf"
index_source := "org/index.org"

# Recipes
# =======


# List all the just recipes.
list:
	@just --list

# Locally update html files using org files as source.
htmls:
	emacs -l org_publish.el --batch {{index_source}} --eval="(org-publish-all (symbol-name 'org))" --kill


# Locally update and publish the website
website: htmls pdfs
	# To update the website, please git add and push manually.

# Locally update all the pdf documents linked on the website.
pdfs:
	cp {{cv_source}} {{cv_sink}}
	cp {{teaching_statement_source}} {{teaching_statement_sink}}
