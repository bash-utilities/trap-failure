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

Run the `example_usage.sh` script via Bash...


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
