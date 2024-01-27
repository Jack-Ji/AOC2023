import std
import vec

let input = read_file("5.txt", true)

if not input:
    fatal_exit("read input failed!")

let lines = tokenize(input, "\n", " ")

let ss = tokenize(lines[0], " ", " ").slice(1, -1)
let seed_ranges : [[int]] = []
var i = 0
while (i < ss.length):
    let a, n = string_to_int(ss[i]), string_to_int(ss[i+1])
    insert_ordered(seed_ranges, [a, a+n]): _a[0] < _b[0]
    i += 2

let soil2seed : [[int]] = []
let firtilizer2soil : [[int]] = []
let water2fertilizer : [[int]] = []
let light2water : [[int]] = []
let temperature2light : [[int]] = []
let humidity2temperature : [[int]] = []
let location2humidity : [[int]] = []

var xs = []
for(lines.slice(2, -1)) l:
    guard l != ""
    switch l:
        case "seed-to-soil map:": xs = soil2seed
        case "soil-to-fertilizer map:": xs = firtilizer2soil
        case "fertilizer-to-water map:": xs = water2fertilizer
        case "water-to-light map:": xs = light2water
        case "light-to-temperature map:": xs = temperature2light
        case "temperature-to-humidity map:": xs = humidity2temperature
        case "humidity-to-location map:": xs = location2humidity
        default:
            let k = map tokenize(l, " ", " "): string_to_int(_)
            insert_ordered(xs, k): _a[0] < _b[0]

def location_to_seed(location):
    let maps = [
        location2humidity,
        humidity2temperature,
        temperature2light,
        light2water,
        water2fertilizer,
        firtilizer2soil,
        soil2seed,
    ]
    var src = location
    for(maps) m:
        for(m) e: 
            if src < e[0]: break
            if src >= e[0] and src < e[0]+e[2]:
                src = e[1]+src-e[0]
                break
    return src

def in_seed_range(seed):
    for(seed_ranges) r:
        if seed < r[0]:
            return false
        if seed >= r[0] and seed < r[1]:
            return true
    return false

var location = location2humidity[0][0]
while true:
    if in_seed_range(location_to_seed(location)):
        print location
        return
    location++
