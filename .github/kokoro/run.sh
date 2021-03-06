#!/bin/bash

set -e

CALLED=$_
[[ "${BASH_SOURCE[0]}" != "${0}" ]] && SOURCED=1 || SOURCED=0

SCRIPT_SRC="$(realpath ${BASH_SOURCE[0]})"
SCRIPT_DIR="$(dirname "${SCRIPT_SRC}")"

export PATH="/usr/sbin:/usr/bin:/sbin:/bin"

cd github/$KOKORO_DIR

. $SCRIPT_DIR/steps/git.sh
. $SCRIPT_DIR/steps/hostsetup.sh
. $SCRIPT_DIR/steps/hostinfo.sh
. $SCRIPT_DIR/steps/compiler.sh

set +e

echo
echo "---------------------------------------------------------------"
echo " Building Verible"
echo "---------------------------------------------------------------"
set -x
bazel build --noshow_progress --cxxopt='-std=c++17' //...
RET=$?
set +x

if [[ $RET = 0 ]]; then
  echo
  echo "---------------------------------------------------------------"
  echo " Testing Verible"
  echo "---------------------------------------------------------------"
  set -x
  bazel test --noshow_progress --cxxopt='-std=c++17' //...
  RET=$?
  set +x
else
  echo
  echo "Not testing as building failed."
fi

echo
echo "---------------------------------------------------------------"
echo " Converting test logs"
echo "---------------------------------------------------------------"
. $SCRIPT_DIR/steps/convert-logs.sh

exit $RET
