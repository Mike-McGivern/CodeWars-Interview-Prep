let validate (str:string) =
  str
  |> Seq.choose (fun c -> if System.Char.IsDigit c then Some (int c - int '0') else None)
  |> Seq.rev
  |> Seq.mapi (fun i d ->
    if i % 2 = 1 then
      let doubled = d * 2
      if doubled > 9 then doubled - 9 else doubled
    else d)
  |> Seq.sum
  |> fun total -> total % 10 = 0
