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

let card_accounts = map(winning): 1
for (card_accounts.length) i:
    var p = 0
    for(winning[i]) n:
        if (exists(has[i]): _ == n): p++
    for(p) j:
        if i+1+j >= card_accounts.length: break
        card_accounts[i+1+j] += card_accounts[i]
        
print card_accounts.sum

