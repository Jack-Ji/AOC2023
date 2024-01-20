import std
import vec

let input = read_file("2.txt", true)

if not input:
    fatal_exit("read input failed!")

let lines = tokenize(input, "\n", " ")
let games: [[int3]] = []
for lines:
    let game: [int3] = []
    let off = find_string(_a, ":")
    for tokenize(substring(_a, off+2, -1), ";", " "):
        let rgb = int3_0
        for tokenize(_b, ",", " "):
            let xs = tokenize(_c, " ", " ")
            switch xs[1]:
                case "red": rgb.x = string_to_int(xs[0])
                case "green": rgb.y = string_to_int(xs[0])
                case "blue": rgb.z = string_to_int(xs[0])
                default: fatal_exit("invalid color {xs[1]}")
        game.push(rgb)
    games.push(game)

let has = int3{12, 13, 14}
let ids = []
for(games) game, id:
    var g = id + 1
    for game:
        if _.x > has.x or _.y > has.y or _.z > has.z:
            g = 0
            break
    ids.push(g)

print ids.sum
