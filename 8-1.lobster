import std
import vec
import dictionary

let input = read_file("8.txt", true)

if not input:
    fatal_exit("read input failed!")

let lines = tokenize(input, "\n", " ")
let instructions = lines[0]

class node:
    left: string
    right: string

let graph = dictionary<string, node>(1024)
for (lines.slice(2, -1)) l:
    let n = node{l.substring(7, 3), l.substring(12, 3)}
    graph.set(l.substring(0, 3), n)

var steps = 0
var cur = "AAA"
while cur != "ZZZ":
    let curnode = graph.get(cur)
    guard curnode
    if instructions[steps % instructions.length] == 'L':
        cur = curnode.left
    else:
        cur = curnode.right
    steps++

print steps
