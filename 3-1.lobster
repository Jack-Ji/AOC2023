import std
import vec

let input = read_file("3.txt", true)

if not input:
    fatal_exit("read input failed!")

let lines = tokenize(input, "\n", " ")

def is_symbol(c):
    return c != '.' and (c < '0' or c > '9')

def next_to_symbol(row, col_start, col_end):
    var x0,x1,y0,y1 = col_start,col_end,row,row
    if col_start > 0:
        x0 = col_start-1
    else:
        x0 = col_start
    if col_end < lines[0].length-1:
        x1 = col_end+1
    if row > 0:
        y0 = row-1
    if row < lines.length-1:
        y1 = row+1
    var y = y0
    while y <= y1:
        var x = x0
        while x <= x1:
            if is_symbol(lines[y][x]):
                return true
            x += 1
        y += 1
    return false

let parts = []
for(lines) l, row:
    var col_start, col_end = -1, -1
    for(l) c, i:
        if c >= '0' and c <= '9':
            if col_start == -1:
                col_start = i
                col_end = i
            else:
                col_end++
            if col_end == l.length-1 and next_to_symbol(row, col_start, col_end):
                parts.push(string_to_int(substring(l, col_start, col_end-col_start+1)))
        else:
            if col_start != -1 and next_to_symbol(row, col_start, col_end):
                parts.push(string_to_int(substring(l, col_start, col_end-col_start+1)))
            col_start = -1

print parts.sum
