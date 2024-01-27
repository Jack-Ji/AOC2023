import std
import vec

let input = read_file("5.txt", true)

if not input:
    fatal_exit("read input failed!")

let lines = tokenize(input, "\n", " ")

let seeds = map tokenize(lines[0], " ", " ").slice(1, -1):
    string_to_int(_)

let seed2soil : [[int]] = []
let soil2fertilizer : [[int]] = []
let fertilizer2water : [[int]] = []
let water2light : [[int]] = []
let light2temperature : [[int]] = []
let temperature2humidity : [[int]] = []
let humidity2location : [[int]] = []

var xs = []
for(lines.slice(2, -1)) l:
    guard l != ""
    switch l:
        case "seed-to-soil map:": xs = seed2soil
        case "soil-to-fertilizer map:": xs = soil2fertilizer
        case "fertilizer-to-water map:": xs = fertilizer2water
        case "water-to-light map:": xs = water2light
        case "light-to-temperature map:": xs = light2temperature
        case "temperature-to-humidity map:": xs = temperature2humidity
        case "humidity-to-location map:": xs = humidity2location
        default:
            let k = map tokenize(l, " ", " "): string_to_int(_)
            insert_ordered(xs, k): _a[1] < _b[1]

def seed_to_location(seed):
    let maps = [
        seed2soil,
        soil2fertilizer,
        fertilizer2water,
        water2light,
        light2temperature,
        temperature2humidity,
        humidity2location
    ]
    var src = seed
    for(maps) m:
        for(m) e: 
            if src < e[1]: break
            if src >= e[1] and src < e[1]+e[2]:
                src = e[0]+src-e[1]
                break
    return src

let locations = map seeds: seed_to_location(_)
print locations.min
