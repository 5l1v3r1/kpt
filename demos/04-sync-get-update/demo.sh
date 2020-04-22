#!/bin/bash
# Copyright 2019 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

export PROMPT_TIMEOUT=3600

########################
# include the magic
########################
. demo-magic/demo-magic.sh

cd $(mktemp -d)
git init

# hide the evidence
clear

pwd

bold=$(tput bold)
normal=$(tput sgr0)

# start demo
echo "  ${bold}init the local package...${normal}"
pe "kpt pkg init .  --description 'sample package'"
pe "git add ."

echo ""
echo "  ${bold}add the dependency...${normal}"
pe "kpt pkg sync set https://github.com/GoogleContainerTools/kpt.git/package-examples/helloworld-set@v0.3.0 helloworld-prod"
pe "git diff -w"

echo ""
echo "  ${bold}sync the package...${normal}"
pe "kpt pkg sync ."
pe "git status"
pe "config tree helloworld-prod"
pe "git add . && git commit -m 'add helloworld package for production'"


pe "kpt pkg sync set https://github.com/GoogleContainerTools/kpt.git/package-examples/helloworld-set@v0.4.0 helloworld-staging"
pe "git diff -w"
pe "kpt pkg sync ."
pe "git status"
pe "kpt cfg tree helloworld-staging"
pe "git add . && git commit -m 'add helloworld package for staging'"

pe "diff helloworld-prod helloworld-staging"

echo ""
echo "  ${bold}update prod...${normal}"
pe "kpt pkg sync set https://github.com/GoogleContainerTools/kpt.git/package-examples/helloworld-set@v0.4.0 helloworld-prod"
pe "git diff -w"
pe "kpt pkg sync ."
pe "git diff -w"
pe "git add . && git commit -m 'add hellworld package for staging'"
