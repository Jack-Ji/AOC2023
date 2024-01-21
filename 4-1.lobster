import std
import vec

let input = read_file("4.txt", true)

if not input:
    fatal_exit("read input failed!")

let lines = tokenize(input, "\n", " ")

let winning: [[int]] = []
let has: [[int]] = []
for(lines) l:
    let i = find_string(l, ":")
    let j = find_string(l, "|")
    let s_wining = substring(l, i+2, j-i-3)
    let s_has = substring(l, j+2, -1) 
    winning.push(map tokenize(s_wining, " ", " "): string_to_int(_))
    has.push(map tokenize(s_has, " ", " "): string_to_int(_))

assert winning.length == has.length

let points = map(winning) w, i:
    var p = 0
    for(w) n:
        if (exists(has[i]): _ == n):
            p++
    p > 0 and pow(2, p-1) or 0

print points.sum
