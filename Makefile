lint-python:
	poetry run flake8 --max-complexity 11 --max-line-length 120 --count
	poetry run black --check .

format-python:
	poetry run isort .
	poetry run black .

.PHONY: megalint megalint-apply clean-megalint
megalint:
	docker run --platform linux/amd64 --rm \
		-v /var/run/docker.sock:/var/run/docker.sock:rw \
		-v $(shell pwd):/tmp/lint:rw \
		ghcr.io/oxsecurity/megalinter:v9.6.0

megalint-apply:
	docker run --platform linux/amd64 --rm \
		-v /var/run/docker.sock:/var/run/docker.sock:rw \
		-v $(shell pwd):/tmp/lint:rw \
		-e APPLY_FIXES=all \
		ghcr.io/oxsecurity/megalinter:v9.6.0

clean-megalint:
	rm -rf megalinter-reports
