.PHONY: build clean test api-bench benchmark mcp-test install-deps

install-deps:
	npm install

build:
	go build -o hello-go-mcp ./cmd/server
	go build -o benchmark ./cmd/benchmark

clean:
	rm -f hello-go-mcp benchmark

test:
	./scripts/test-with-curl.sh

mcp-test: install-deps
	npx mcp-test run -v --url $(SERVER_URL:mcp=)

api-bench:
	oha --disable-color -c 125 -n 1250000 http://localhost:7881/api/hello?name=Asdf

SERVER_URL ?= http://localhost:7881/mcp
USERS ?= 125
REQUESTS ?= 10000
TOOL ?= hello
ARGS ?= {}

benchmark: build
	./benchmark -s $(SERVER_URL) -u $(USERS) -r $(REQUESTS) -t $(TOOL) -a '$(ARGS)'
