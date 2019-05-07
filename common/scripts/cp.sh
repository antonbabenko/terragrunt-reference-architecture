#!/bin/bash

# This script is used by Terragrunt hook to copy file into current directory (no overwrites) and return exit code OK (true)

cp -n "$1" . 2>/dev/null || :
