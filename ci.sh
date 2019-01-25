git clone git@github.com:exosphere-lang/examples.git > /dev/null 2>&1
git clone git@github.com:exosphere-lang/compiler.git > /dev/null 2>&1

cd compiler

stack build --copy-bins > /dev/null 2>&1

cd ..

for i in $(find ./ -name \*.exo); do
    OUTPUT=`exospherec $i`
    [ ! -z "$OUTPUT" ] && echo "ERR: compiling $i: $OUTPUT" && exit 1
done
