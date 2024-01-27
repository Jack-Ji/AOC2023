import std
import vec

let input = read_file("6.txt", true)

if not input:
    fatal_exit("read input failed!")

let lines = tokenize(input, "\n", " ")
let ss_time = tokenize(lines[0], " ", " ")
let ss_distance = tokenize(lines[1], " ", " ")
let times = map(slice(ss_time, 1, -1)): string_to_int(_)
let distances = map(slice(ss_distance, 1, -1)): string_to_int(_)

let ways = map2(times, distances):
    let time, dist = _a, _b
    var n = 0
    var i = 1
    while i < time:
        if i*(time-i) > dist: n++
        i++
    n

print(reduce(ways): _a * _b)
