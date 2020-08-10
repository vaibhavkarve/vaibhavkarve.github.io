;; Taken from https://orgmode.org/worg/org-tutorials/org-publish-html-tutorial.html

(require 'ox-publish)
(setq org-publish-project-alist
      '(
	;; ... add all the components here (see below)...
	("org-notes"
	 :base-directory "~/org/website/org/"
	 :base-extension "org"
	 :publishing-directory "~/org/website/"
	 :recursive t
	 :publishing-function org-html-publish-to-html
	 :headline-levels 4             ; Just the default for this project.
	 :auto-preamble t
	 :auto-sitemap t                ; Generate sitemap.org automagically...
	 :sitemap-filename "sitemap.org"  ; ... call it sitemap.org (it's the default)...
	 :sitemap-title "Sitemap"         ; ... with title 'Sitemap'.
	 )

	("org-static"
	 :base-directory "~/org/website/org/"
	 :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
	 :publishing-directory "~/org/website/"
	 :recursive t
	 :publishing-function org-publish-attachment
	 )

	("org" :components ("org-notes" "org-static"))

))
