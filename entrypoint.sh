#!/bin/bash

function install_binary() {
    go get github.com/honeycombio/honeymarker
}

function create_marker() {
    honeymarker --writekey=${INPUT_APIKEY} -d ${INPUT_DATASET} add --type=${INPUT_TYPE} -m ${INPUT_MESSAGE}
}

install_binary
create_marker