# docktor

[![Build Status](https://travis-ci.com/nishgowda/docktor.svg?branch=master)](https://travis-ci.com/nishgowda/docktor)
[![Go Report Card](https://goreportcard.com/badge/github.com/nishgowda/docktor)](https://goreportcard.com/report/github.com/nishgowda/docktor)
[![codecov](https://codecov.io/gh/nishgowda/docktor/branch/master/graph/badge.svg?token=G4GHPU44W9)](https://codecov.io/gh/nishgowda/docktor)

docktor is a security tool for docker containers that allow you to implement efficient and reliable healthchecks to them.

Some highlights of docktor:
 - Creates automatic healthchecks to running docker containers
 - Implements automated healing for any unhealthy docker containers running
 - Adds manual healing as well
 - Suggests security to improvements in a given Dockerfile
 - Scans Docker images for vulnerabilites and generate reports to files

## Installation
If you would like to run the project locally use the following command
```
go get github.com/nishgowda/docktor
```

## Building docktor
After installation building the docktor binary can be done with the following command (this will create the binary in the existing bin folder)
``` 
make build
```

However you can also install binary from this git repo
```
go get github.com/nishgowda/docktor/bin/docktor
```

## Command Line
### Usage
```
# first have a container running already

# run healthcheck on all containers
./bin/./docktor healtheck --c <container id>

# heal an unhealthy conainer
./bin/./docktor heal --c <container id>

# apply autoheal to containers
./bin/./doctkor autoheal --c <container id>

# scan for vulnerabilites
./bin/./doctkor scan --i <image id> --f <report path>

# suggest improvemets for dockerfile
./bin/./docktor suggest --f <file path>


## How you enter the binaries will depend on your os
```
**Note:** You can also use the --help command for any clarifications about the commands

## API
You can also start the server and make requests to perform docktor functions.
 - GET /hcheck?container=
 - GET /heal?container= 
 - GET /aheal?container=
- GET /scan?image=
- GET /suggest?file=

Usage
```
# If you dont specify the container it will perform functions on all running containers

curl --request GET 'http://localhost:3001/hcheck'
curl --request GET 'http://localhost:3001/heal'
curl --request GET 'http://localhost:3001/aheal'
curl --request GET 'http://localhost:3001/hcheck'

# must specify the docker image and file respectively 
curl --request GET 'http://localhost:3001/scan?image=nginx'
curl --request GET 'http://localhost:3001/suggest?file=Dockerfile
```

## Contributing
Any contributions are welcome, just clone this repo and submit a PR to this branch.