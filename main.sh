#!/bin/bash

set -e

if [ -n "${GITHUB_WORKSPACE}" ]; then
  cd "${GITHUB_WORKSPACE}" || exit
fi

CONFIG_FILE_OPTION=""

if [[ -n ${INPUT_REPORT_FILE} ]]; then
  echo "::debug::Using report file ${INPUT_REPORT_FILE}"
  CONFIG_FILE_OPTION+=" --out ${INPUT_REPORT_FILE}"
fi

if [[ -n ${INPUT_REPORT_FORMAT} ]]; then
  echo "::debug::Using report format ${INPUT_REPORT_FORMAT}"
  CONFIG_FILE_OPTION+=" --format ${INPUT_REPORT_FORMAT}"
fi

if [ -n "${INPUT_CONFIG_FILE}" ]; then
  echo "::debug::Using config file ${INPUT_CONFIG_FILE}"
  CONFIG_FILE_OPTION+=" --config-file ${INPUT_CONFIG_FILE}"
fi

if [ -n "${INPUT_TFSEC_ARGS}" ]; then
  echo "::debug::Using specified args: ${INPUT_TFSEC_ARGS}"
  CONFIG_FILE_OPTION+=" ${INPUT_TFSEC_ARGS}"
fi

# format the command according to the provided arguments
tfsec "${INPUT_WORKING_DIRECTORY}" ${CONFIG_FILE_OPTION}

tfsec_return="${PIPESTATUS[0]}"

echo ::set-output name=tfsec-return-code::"${tfsec_return}"
