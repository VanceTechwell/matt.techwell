.PHONY: setup dev run

# Define NOTION_PAGE_ID as a variable (replace the placeholder with your actual page ID)
NOTION_PAGE_ID=141ff841048b8086805af1da2412aeb4

setup:
	docker build . -t morethan-log ; \
	docker run -it --rm -v $(PWD):/app morethan-log /bin/bash -c "yarn install" ; \
	echo NOTION_PAGE_ID=$(NOTION_PAGE_ID) > .env.local

dev:
	docker run -it --rm -v $(PWD):/app -p 8001:3000 morethan-log /bin/bash -c "yarn run dev"

run:
	docker run -it --rm -v $(PWD):/app morethan-log /bin/bash

