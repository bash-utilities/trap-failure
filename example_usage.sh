#!/usr/bin/env bash


# Exampe usage for Trap Failure, a submodule for other Git tracked Bash scripts
# Copyright (C) 2019  S0AndS0
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published
# by the Free Software Foundation; version 3 of the License.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.


set -E -o functrace

## Optional, but recommended to find true directory this script resides in
__SOURCE__="${BASH_SOURCE[0]}"
while [[ -h "${__SOURCE__}" ]]; do
    __SOURCE__="$(find "${__SOURCE__}" -type l -ls | sed -n 's@^.* -> \(.*\)@\1@p')"
done
__DIR__="$(cd -P "$(dirname "${__SOURCE__}")" && pwd)"


## Source module code within this script
source "${__DIR__}/modules/trap-failure/failure.sh"

trap 'failure "LINENO" "BASH_LINENO" "${BASH_COMMAND}" "${?}"' ERR


something_functional() {
    _req_arg_one="${1:?something_functional needs two arguments, missing the first already}"
    _opt_arg_one="${2:-SPAM}"
    _opt_arg_two="${3:0}"
    printf 'something_functional: %s %s %s' "${_req_arg_one}" "${_opt_arg_one}" "${_opt_arg_two}"
    ## Generate an error by calling nothing
    "${__DIR__}/nothing.sh"
}


something_functional 'spam' 'ham' || echo "Ignored something_functional returning $?"

if [[ "$(something_functional 'spam')" == '0' ]]; then
    printf 'Nothing somehow was something?!\n' >&2 && exit 1
fi

echo "### Testing Failure Trap ###"
something_functional 'spam'
