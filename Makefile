init: # Download (testing) dependencies 
	go mod download

test: init # Run tests
	go test -v

format:
	go fmt $(shell go list ./... | grep -v /vendor/) && \
	go vet $(shell go list ./... | grep -v /vendor/) && \
	golangci-lint run --fast --timeout 5m0s --issues-exit-code 1

gofumpt:
	gofumpt -w -extra -lang go1.20 .

tidy:
	go mod tidy -compat=1.20
