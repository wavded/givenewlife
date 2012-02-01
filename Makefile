JADE = $(shell find src -maxdepth 1 -name "*.jade")
STYLUS = $(shell find src -maxdepth 1 -name "*.styl")
HTML = $(JADE:.jade=.html)
CSS  = $(STYLUS:.styl=.css)

all: $(HTML)
all: $(CSS)

%.html: %.jade
	jade -p src/index.jade < $< > $(subst src,web,$@)

%.css: %.styl
	stylus -c --include-css -u nib < $< > $(subst src,web,$@)

clean:
	rm -f $(HTML)
	rm -f $(CSS)

deploy_live: all
deploy_live:
	@rsync -az --delete web/* root@ec-web20:/var/www/html/givenewlife
	@rsync -az --delete web/* root@ec-web21:/var/www/html/givenewlife

.PHONY: clean deploy
