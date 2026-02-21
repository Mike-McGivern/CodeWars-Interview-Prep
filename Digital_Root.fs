module DigitalRoot.Solution

let rec digitalRoot (n: int): int = 
    if n < 10 then
      n
    else
      let sum =
          n
          |> string
          |> Seq.sumBy (fun c -> int c - int '0')
      digitalRoot sum
