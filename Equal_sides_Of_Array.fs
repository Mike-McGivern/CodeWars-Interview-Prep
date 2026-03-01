let findEvenIndex (items : int array) = 
    let total = Array.sum items
    let rec loop i leftSum =
      if i = items.Length then -1
      else
        let rightSum = total - leftSum - items.[i]
        if leftSum = rightSum then i
        else loop (i + 1) (leftSum + items.[i])
    loop 0 0
