#!/bin/bash
# Remove this script after package manager implementation

APP_ROOT_PATH=$(cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && cd .. && pwd)
PLATFORM_PATH="${APP_ROOT_PATH}/ostis-web-platform"
WORKING_PATH=$(pwd)

cd "${APP_ROOT_PATH}"/scripts || { echo "Path \"${APP_ROOT_PATH}/scripts\" not found"; exit 1; }

git submodule update --init --recursive
./build_problem_solver.sh

cd "${PLATFORM_PATH}"/scripts || { echo "Path \"${PLATFORM_PATH}/scripts\" not found"; exit 1; }
./build_kb.sh

cd "${WORKING_PATH}" || { echo "Path \"${WORKING_PATH}\" not found"; exit 1; }
