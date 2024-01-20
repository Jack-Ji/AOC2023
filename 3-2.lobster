import std
import vec

let input = read_file("3.txt", true)

if not input:
    fatal_exit("read input failed!")

let lines = tokenize(input, "\n", " ")

def is_digit(c):
    return c >= '0' and c <= '9'

def get_gear_ratio(row, col):
    let parts = []
    var off = 0
    if row > 0:
        if lines[row-1][col].is_digit():
            off = col
            while off > 0 and lines[row-1][off-1].is_digit(): off--
            parts.push(string_to_int(substring(lines[row-1], off, -1)))
        else:
            if col > 0 and lines[row-1][col-1].is_digit():
                off = col-1
                while off > 0 and lines[row-1][off-1].is_digit(): off--
                parts.push(string_to_int(substring(lines[row-1], off, -1)))
            if col < lines[0].length-1 and lines[row-1][col+1].is_digit():
                off = col+1
                parts.push(string_to_int(substring(lines[row-1], off, -1)))
    if row < lines.length - 1:
        if lines[row+1][col].is_digit():
            off = col
            while off > 0 and lines[row+1][off-1].is_digit(): off--
            parts.push(string_to_int(substring(lines[row+1], off, -1)))
        else:
            if col > 0 and lines[row+1][col-1].is_digit():
                off = col-1
                while off > 0 and lines[row+1][off-1].is_digit(): off--
                parts.push(string_to_int(substring(lines[row+1], off, -1)))
            if col < lines[0].length-1 and lines[row+1][col+1].is_digit():
                off = col+1
                parts.push(string_to_int(substring(lines[row+1], off, -1)))
    if col > 0 and lines[row][col-1].is_digit():
        off = col-1
        while off > 0 and lines[row][off-1].is_digit(): off--
        parts.push(string_to_int(substring(lines[row], off, -1)))
    if col < lines[0].length-1 and lines[row][col+1].is_digit():
        off = col+1
        parts.push(string_to_int(substring(lines[row], off, -1)))
    if parts.length == 2:
        return parts[0] * parts[1]
    return 0

let gears = []
for(lines) l, row:
    for(l) c, col:
        if c == '*':
            gears.push(get_gear_ratio(row, col))

print gears.sum

