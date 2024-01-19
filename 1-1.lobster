import std

let input = read_file("1.txt", true)

if not input:
    fatal_exit("read input failed!")

let xs1 = tokenize(input, "\n", " ")
let xs2 = map(xs1): filter _1: _2 >= '0' and _2 <= '9'
let xs3 = map(xs2): (_[0]-'0')*10 + _[_.length-1] - '0'
print(xs3.sum)
