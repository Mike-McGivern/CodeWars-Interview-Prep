let squaresInRect lng wdth = 
  if lng = wdth then None
  else
    let rec cut a b acc =
      if a = 0 || b = 0 then List.rev acc
      else
        if a > b then cut (a - b) b (b :: acc)
        else cut a (b - a) (a :: acc)
    Some (cut lng wdth [])

(*
module Tests = begin
    open Fuchu
    let testing lng wdth expectedOutput = 
        Assert.Equal("", expectedOutput, squaresInRect lng wdth)
    let suite =
        testList "squaresInRect" [
            testCase "Basic tests" <| (fun _ ->
                testing 5 5 None
                testing 5 3 (Some [3; 2; 1; 1])
                testing 3 5 (Some [3; 2; 1; 1])
            );
        ]
end

*)
