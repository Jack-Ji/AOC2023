import std
import vec

let input = read_file("7.txt", true)

if not input:
    fatal_exit("read input failed!")

let lines = tokenize(input, "\n", " ")

enum card:
    two
    three
    four
    five
    six
    seven
    eight
    nine
    ten
    j
    q
    k
    a

enum type:
    high_card
    one_pair
    two_pair
    three_of_a_kind
    full_house
    four_of_a_kind
    five_of_a_kind

struct hand:
    cards: [card]
    bet: int

    def determin_type() -> type:
        let cs = qsort(cards): _a < _b

        if (cs[0] == cs[1] and cs[0] == cs[2]
                and cs[0] == cs[3] and cs[0] == cs[4]):
            return five_of_a_kind

        if ((cs[0] == cs[1] and cs[0] == cs[2]
                and cs[0] == cs[3]) or 
            (cs[1] == cs[2] and cs[1] == cs[3]
                and cs[1] == cs[4])):
            return four_of_a_kind

        if ((cs[0] == cs[1] and cs[0] == cs[2]
                and cs[3] == cs[4]) or 
            (cs[0] == cs[1] and cs[2] == cs[3]
                and cs[2] == cs[4])):
            return full_house

        if ((cs[0] == cs[1] and cs[0] == cs[2]) or 
            (cs[1] == cs[2] and cs[1] == cs[3]) or
            (cs[2] == cs[3] and cs[2] == cs[4])):
            return three_of_a_kind

        if ((cs[0] == cs[1] and cs[2] == cs[3]) or 
            (cs[0] == cs[1] and cs[3] == cs[4]) or
            (cs[1] == cs[2] and cs[3] == cs[4])):
            return two_pair

        if ((cs[0] == cs[1]) or 
            (cs[1] == cs[2]) or 
            (cs[2] == cs[3]) or 
            (cs[3] == cs[4])):
            return one_pair

        return high_card

    def operator<(b: hand):
        let t1 = determin_type()
        let t2 = determin_type(b)
        if t1 != t2:
            return t1 < t2
        else:
            for(5) i:
                if cards[i] != b.cards[i]:
                    return cards[i] < b.cards[i]
        return false

let hands = map(lines):
    let ss = tokenize(_l, " ", " ")
    let cards = map(ss[0]):
        switch _c:
            case '2': two
            case '3': three
            case '4': four
            case '5': five
            case '6': six
            case '7': seven
            case '8': eight
            case '9': nine
            case 'T': ten
            case 'J': j
            case 'Q': q
            case 'K': k
            case 'A': a
            default: a
    let bet = string_to_int(ss[1])
    hand{cards, bet}

let sorted = qsort(hands): _a < _b
var winning = 0
for (sorted) h, i:
    winning += h.bet *  (i+1)
print winning
