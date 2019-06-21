## Example Usage for Bash Trap Failure


------


#### Table of Contents


- [Example Usage](#example-usage)
- [License](#license)

> See the [`master`][master_branch] branch of this project for installation instructions, support guidance, and system requirements.


------


## Example Usage


Clone this project and switch to the `examples` Git `branch`...


```bash
git clone https://github.com/bash-utilities/trap-failure.git
cd trap-failure
git checkout examples
```

Run the [`example_usage.sh`][branch__master__failure] script via Bash...


```bash
bash example_usage.sh
```


Expect output similar to...


```
something_functional: spam ham example_usage.sh: line 42: ~/bash-utilities/trap-failure/nothing.sh: No such file or directory
Ignored something_functional returning 127
example_usage.sh: line 42: ~/bash-utilities/trap-failure/nothing.sh: No such file or directory
### Testing Failure Trap ###
something_functional: spam SPAM example_usage.sh: line 42: ~/bash-utilities/trap-failure/nothing.sh: No such file or directory
---
lines_history: [42 42 53 0]
function_trace: [failure something_functional main]
exit_code: 127
source_trace:
  - ~/bash-utilities/trap-failure/modules/trap-failure/failure.sh
  - example_usage.sh
  - example_usage.sh
last_command: "${__DIR__}/nothing.sh"
---
```


> Note, the `failure` function outputs to the second Linux file descriptor (`2` AKA `stderr`), so the usual logging or silencing of error messages, eg. _`example_usage.sh 2>/dev/null`_, should work as expected.


The key takeaways from the above script are...


```bash
set -E -o functrace
source "${__DIR__}/modules/trap-failure/failure.sh"
trap 'failure "LINENO" "BASH_LINENO" "${BASH_COMMAND}" "${?}"' ERR
```


- The `set` line allows for one more layer of tracing what tripped the trap within the line number list

- The `source` line _pulls_ the `failure` function into the same scope as the example usage script

- The `trap` line passes references to


... of which the `failure` function...


```
---
lines_history: [42 42 53 0]
function_trace: [failure something_functional main]
exit_code: 127
source_trace:
  - ~/bash-utilities/trap-failure/failure.sh
  - example_usage.sh
  - example_usage.sh
last_command: "${__DIR__}/nothing.sh"
---
```


... exposed that on line `53` of the _`main`_ script (`example_usage.sh` in this case), when _`something_functional`_ got to line `42` an error occurred attempting to run _`${__DIR__}/nothing.sh`_, which intentionally does not exist for demonstration purposes.


> `0` from the `lines_history` array is a reference to the terminal and usually can be ignored.
>
> `42` and `failure` pare may be ignored in most cases too, and future revisions this may be _pruned_ this from output.



## License


```
Example Usage for Bash Trap Failure, a submodule for Git tracked Bash scripts
Copyright (C) 2019  S0AndS0

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published
by the Free Software Foundation; version 3 of the License.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
```



[master_branch]: https://github.com/bash-utilities/trap-failure
[branch__master__failure]: https://github.com/bash-utilities/trap-failure/blob/master/failure.sh
