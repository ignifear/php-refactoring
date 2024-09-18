help: ## Prints this help.
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

build: ## Build container
	docker build -t php-finder-refactor .

run:
	docker run --rm -v `pwd`:/usr/app -it php-finder-refactor bash

test:
	docker run --rm php-finder-refactor ./vendor/bin/phpunit --colors=always --testdox --configuration phpunit.xml
