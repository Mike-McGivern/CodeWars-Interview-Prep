let zeros n = 
  let rec count acc p =
    if p > n then acc
    else count (acc + n / p) (p * 5)
  count 0 5


module Tests = begin
    open Fuchu
    let suite =
        testList "Number of trailing zeroes of N!" [
            testCase "0!" <|
              fun _ -> Assert.Equal("0! has 0 trailing zeros", 0, zeros 0)
            testCase "6!" <|
              fun _ -> Assert.Equal("6! has 1 trailing zeros", 1, zeros 6)
            testCase "30!" <|
              fun _ -> Assert.Equal("30! has 7 trailing zeros", 7, zeros 30)
            testCase "100!" <|
              fun _ -> Assert.Equal("100! has 24 trailing zeros", 24, zeros 100)
            testCase "1000!" <|
              fun _ -> Assert.Equal("1000! has 249 trailing zeros", 249, zeros 1000)
            testCase "100000!" <|
              fun _ -> Assert.Equal("100000! has 24999 trailing zeros", 24999, zeros 100000)
            testCase "1000000000!" <|
              fun _ -> Assert.Equal("1000000000! has 249999998 trailing zeros", 249999998, zeros 1000000000)
        ]
end
