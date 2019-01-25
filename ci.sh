git clone https://github.com/exosphere-lang/examples.git
git clone https://github.com/exosphere-lang/compiler.git

cd compiler && stack build --copy-bins
cd ..

for i in $(find ./ -name \*.exo); do
    OUTPUT=`exospherec $i`
    [ ! -z "$OUTPUT" ] && echo "ERR: compiling $i: $OUTPUT" && exit 1
done

echo "All examples successfully compiled..."

rm -rf examples compiler
