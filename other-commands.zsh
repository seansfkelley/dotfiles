alias jsonpretty='python -m json.tool'
alias component-json-files='tsc --noEmit -t ES5 --experimentalDecorators --listFiles $(find . -name "*.ts") | grep -vE "\.\.|_references\.ts|typescript/bin/lib\.d\.ts" | sed -e "s/\(.*\)/\"src\/\1\",/"'
