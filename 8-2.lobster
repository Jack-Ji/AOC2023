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
let locations = []
for (lines.slice(2, -1)) l:
    let n = node{l.substring(7, 3), l.substring(12, 3)}
    graph.set(l.substring(0, 3), n)
    if (l[2] == 'A'):
        locations.push(l.substring(0, 3))

let steps = map(locations):
    var step, loc = 0, _
    while loc[2] != 'Z':
        let inst = instructions[step % instructions.length]
        let curnode = graph.get(loc)
        guard curnode: 
            fatal_exit("get next node failed")
        if inst == 'L':
            loc = curnode.left
        else:
            loc = curnode.right
        step++
    step

def lcm(a, b):
    def gcd(_a, _b) -> int:
        if (_a < _b):
            return gcd(_b, _a)
        elif (_a % _b == 0):
            return _b
        else:
            return gcd(_b, _a%_b)
    return (a*b)/gcd(a,b)

print(fold(steps, 1): lcm(_a, _b))
