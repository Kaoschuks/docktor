GO_PATH = github.com/nishgowda/docktor/lib

# tests and builds executable
all: test-all build

# builds executabke in bin directory
build:
	go build -o bin/docktor bin/main.go

# performs all tests on docktor library functions
test-all: test_healthcheck test_healthcheck test_heal test_suggestions \
			test_scan

test_healthcheck:
	- go test $(GO_PATH)/healthcheck

test_autoheal:
	- go test $(GO_PATH)/autoheal

test_heal:
	- go test $(GO_PATH)/heal

test_suggestions:
	- go test $(GO_PATH)/suggestions

test_scan:
	- go test $(GO_PATH)/scan


