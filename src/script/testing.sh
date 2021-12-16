#!/bin/bash

now=$(date +"%Y-%m-%d_%H-%M")
bundle exec rspec --format documentation >> ../test-docs/${now}-test.log
