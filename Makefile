DOCKER_IMAGE = ghcr.io/alexwlchan/alexwlchan.net:42

ROOT = $(shell git rev-parse --show-toplevel)

JEKYLL_VERSION = 4.3.1
JEKYLL_COMMAND_DIR = /usr/local/bundle/gems/jekyll-$(JEKYLL_VERSION)/lib/jekyll/commands

SERVER_PORT = 5858

html:
	docker run --tty --rm \
		--volume /var/run/docker.sock:/var/run/docker.sock \
		--volume $(ROOT):$(ROOT) \
		--workdir $(ROOT) \
		$(DOCKER_IMAGE) build --trace

lint:
	docker run --tty --rm \
		--volume $(ROOT):$(ROOT) \
		--workdir $(ROOT) \
		--volume $(ROOT)/src/_jekyll/plugins/linter.rb:$(JEKYLL_COMMAND_DIR)/linter.rb \
		$(DOCKER_IMAGE) lint

serve:
	docker run --tty --rm \
		--volume /var/run/docker.sock:/var/run/docker.sock \
		--volume $(ROOT):$(ROOT) \
		--workdir $(ROOT) \
		--publish $(SERVER_PORT):$(SERVER_PORT) \
		$(DOCKER_IMAGE) serve \
			--drafts \
			--incremental \
			--host "0.0.0.0" \
			--port $(SERVER_PORT) \
			--skip-initial-build \
			--trace

deploy:
	docker run --tty --rm \
		--volume $(ROOT):$(ROOT) \
		--workdir $(ROOT) \
		ghcr.io/williamjacksn/netlify-cli \
		deploy --auth "$(NETLIFY_AUTH_TOKEN)"

deploy-prod:
	docker run --tty --rm \
		--volume $(ROOT):$(ROOT) \
		--workdir $(ROOT) \
		ghcr.io/williamjacksn/netlify-cli:17.10.1 \
		deploy --prod --auth "$(NETLIFY_AUTH_TOKEN)"
