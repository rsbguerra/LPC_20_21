#!/bin/bash

for i in {0..5}
do
    test=t0$i
    echo "testing $test"
    if  ./arithc ./test/$test.exp && gcc -g -no-pie ./test/$test.s -o a.out; then
        ./a.out
    fi
    echo ""
done
