#!/bin/zsh

output/build/linux-custom/scripts/clang-tools/gen_compile_commands.py -d output/build/linux-custom -o ../linux-stable/compile_commands.json
sed -i -e "s/-mno-fdpic//g" -e "s/-fno-allow-store-data-races//g" -e "s/-fno-ipa-sra//g" -e "s/-fconserve-stack//g" ../linux-stable/compile_commands.json
