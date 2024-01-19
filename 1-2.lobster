import std

let input = read_file("1.txt", true)

if not input:
    fatal_exit("read input failed!")

let numbers = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
def string_to_numbers(s):
    let ns = []
    for (s.length) off:
        if s[off] >= '0' and s[off] <= '9':
            ns.push(s[off] - '0')
        else:
            for (numbers) x, i:
                if off + x.length <= s.length and x == substring(s, off, x.length):
                    ns.push(i+1)
                    break
    return ns

let xs1 = tokenize(input, "\n", " ")
let xs2 = map(xs1): string_to_numbers _
let xs3 = map(xs2): _[0]*10 + _[_.length-1]
print xs3.sum
