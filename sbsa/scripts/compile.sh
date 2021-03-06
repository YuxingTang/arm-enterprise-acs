#!/usr/bin/env bash
# Copyright (c) 2017, ARM Limited or its affiliates. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

cd ${1}/edk2

export GCC49_AARCH64_PREFIX=${1}/gcc-linaro-5.3.1-2016.05-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-

echo "do_compile: Initializing EDK2 for building."
set --
source edksetup.sh

echo "do_compile: Building BaseTools."
make -C BaseTools/Source/C

echo "do_compile: Building SBSA."
source AppPkg/Applications/sbsa-acs/tools/scripts/avsbuild.sh
