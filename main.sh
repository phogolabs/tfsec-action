#!/bin/sh

set -e

if [ -n "${GITHUB_WORKSPACE}" ]; then
  cd "${GITHUB_WORKSPACE}" || exit
fi

tfsec "${INPUT_WORKING_DIRECTORY}"
