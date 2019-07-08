install_deps:
	- go mod download

build:
	- go build -o build/release-notary ./

# Standard go test
test:
	- go test ./... -v -race

# Make sure no unnecessary dependecies are present
go-mod-tidy:
	- go mod tidy -v
	- git diff --exit-code

# Run all tests & linters in CI
ci:
	- make test 
	- make go-mod-tidy