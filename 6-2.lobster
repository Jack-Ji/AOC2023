import std
import vec

let input = read_file("6.txt", true)

if not input:
    fatal_exit("read input failed!")

let lines = tokenize(input, "\n", " ")
let time = string_to_int(replace_string(substring(lines[0], 10, -1), " ", ""))
let distance = string_to_int(replace_string(substring(lines[1], 10, -1), " ", ""))

var n = 0
var i = 1
var last = 0
while i < time:
    let d = i*(time-i)
    if d > distance:
        n++
    i++
print n
