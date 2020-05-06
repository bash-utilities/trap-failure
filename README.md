## Bash Trap Failure


Outputs Front-Mater formatted failures for Bash functions not returning `0` exit status.


------


#### Table of Contents


- [Requirements](#requirements)
- [Installation](#installation)
- [License](#license)

> See the [`example`][branch__example] Git `branch` for usage examples.

------


## Requirements


Bash version ~4.3 or greater and the following command line utilities;


- `printf` for _returning_ values between functions

- `local` with `-n` and `-a` options available for passing references to variables between functions and assigning local arrays

- `set` is utilizing `set -E -o functrace` or similar prior to setting failure `trap`


> See `info printf` for documentation and `help local` / `help set` for more information on additional options.


## Installation


Add one of the available `clone` URLs to a current project...


```bash
cd your-project

_url='https://github.com/bash-utilities/trap-failure.git'
_dir='modules/trap-failure'

git submodule add -b master "${_url}" "${_dir}"
```


> Older versions of `git` may require the following to populate `${_dir}`...


```bash
git submodule update --init --recursive
```


Check that something similar to the following results from `git status`...


```git
On branch master

Initial commit

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)

	new file:   .gitmodules
	new file:   modules/trap-failure
```


... `commit` and `push` these changes then notify anyone contributing to your project that...


```bash
git submodule update --init --recursive
git submodule update --merge
```


... commands may be useful for updating.


> Tip, those that make a fresh `clone` of your project may use...


```bash
git clone --recurse-submodules <your-repositorys-url>
```


> ... to set-up all the various submodules that your project utilizes.


> Note, if at any point in the future `git submodule foreach git status` reports a detached `HEAD`, and that is somehow bothersome then try...


```bash
cd modules/trap-failure
git checkout master
git pull
```


> ... to re-attach the submodule's `HEAD` once again.


## License


```
Bash Trap Failure documentation on a submodule for Git tracked Bash scripts
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



[help_fork]: https://help.github.com/en/articles/fork-a-repo
[help_pull_request]: https://help.github.com/en/articles/about-pull-requests

[git_book__submodules]: https://git-scm.com/book/en/v2/Git-Tools-Submodules


[relative_link__issues]: issues
[relative_link__members]: network/members
[source_link__failure]: failure.sh

[branch__example]: https://github.com/bash-utilities/trap-failure/tree/example


[badge__issues]: https://img.shields.io/github/issues/bash-utilities/trap-failure.svg
[badge__contributors]: https://img.shields.io/github/forks/bash-utilities/trap-failure.svg?color=005571&label=Contributors

[badge__liberapay]: https://img.shields.io/badge/Liberapay-gray.svg?logo=liberapay
[badge__bitcoin]: https://img.shields.io/badge/1Dr9KYZz9jkUea5xTxeGyScu7AwC4MwR5c-gray.svg?logo=bitcoin


[liberapay_donate]: https://liberapay.com/bash-utilities/donate
[btc]: https://www.blockchain.com/btc/address/1Dr9KYZz9jkUea5xTxeGyScu7AwC4MwR5c
