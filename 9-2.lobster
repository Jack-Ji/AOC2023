import std
import vec
import dictionary

let input = read_file("9.txt", true)

if not input:
    fatal_exit("read input failed!")

let lines = tokenize(input, "\n", " ")

let vs = map(lines) l:
    let xs = tokenize(l, " ", " ")
    map xs: string_to_int(_)

let ns = map(vs) v:
    let vv = [v]::[int]
    def next_step() -> void:
        guard any(vv[vv.length-1])
        let nv = []::int
        for(vv[vv.length-1]) n, i:
            guard i
            nv.push(n - vv[vv.length-1][i-1])
        vv.push(nv)
        next_step()
    next_step()
    reverse_fold(vv, 0) acc, next: next[0] - acc

print(sum(ns))

