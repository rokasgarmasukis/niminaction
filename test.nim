import sequtils, sugar, os

let numbers = @[1, 2, 3, 4, 5]
let odd = filter(numbers, (x: int) -> bool => x mod 2 != 0)
let even = filter(numbers, proc (x: int) : bool = x mod 2 == 0)

assert odd == @[1, 3, 5]
assert even == @[2, 4]

var list : seq[int]
list.add(4)
list.add(19)
list.add(49)
list[2].inc

for i in 0 .. list.len - 1:
    stdout.write($list[i] & " ")

for item in list:
    stdout.write($item & ",")

for filename in walkFiles("*.*"):
    echo filename