#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

if [[ "${TRACE-0}" == "1" ]]; then
    set -o xtrace
fi

DOTFILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo ""
echo "👊  All done."
