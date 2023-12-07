import Data.List

scoreLabel :: Char -> Integer
scoreLabel 'J' = 0
scoreLabel '2' = 1
scoreLabel '3' = 2
scoreLabel '4' = 3
scoreLabel '5' = 4
scoreLabel '6' = 5
scoreLabel '7' = 6
scoreLabel '8' = 7
scoreLabel '9' = 8
scoreLabel 'T' = 9
scoreLabel 'Q' = 10
scoreLabel 'K' = 11
scoreLabel 'A' = 12

handType :: String -> Integer
handType [a,'J','J','J','J']        = 6
handType [a,b,'J','J','J'] | a == b = 6
handType [a,b,'J','J','J']          = 5
handType [a,b,c,'J','J'] | a == b && b == c = 6
handType [a,b,c,'J','J'] | a == b || b == c = 5
handType [a,b,c,'J','J']                    = 3
handType [a,b,c,d,'J'] | a == b && b == c && c == d               = 6
handType [a,b,c,d,'J'] | (a == b && b == c) || (b == c && c == d) = 5
handType [a,b,c,d,'J'] | a == b && c == d                         = 4
handType [a,b,c,d,'J'] | a == b || b == c || c == d               = 3
handType [a,b,c,d,'J']                                            = 1
handType [a,b,c,d,e] | a == b && b == c && c == d && d == e                           = 6
handType [a,b,c,d,e] | (a == b && b == c && c == d) || (b == c && c == d && d == e)   = 5
handType [a,b,c,d,e] | (a == b && b == c && d == e) || (a == b && c == d && d == e)   = 4
handType [a,b,c,d,e] | (a == b && b == c) || (b == c && c == d) || (c == d && d == e) = 3
handType [a,b,c,d,e] | (a == b && c == d) || (a == b && d == e) || (b == c && d == e) = 2
handType [a,b,c,d,e] | a == b || b == c || c == d || d == e                           = 1
handType [a,b,c,d,e]                                                                  = 0

scoreHand :: [String] -> (Integer, Integer)
scoreHand [h@[a,b,c,d,e], bid] = (score, read bid)
    where score = 13^0 * scoreLabel e +
                  13^1 * scoreLabel d +
                  13^2 * scoreLabel c +
                  13^3 * scoreLabel b +
                  13^4 * scoreLabel a +
                  10000000 * handType (sortOn (\c -> if c == 'J' then 'Z' else c) h)

main = do
    contents <- getContents
    let scoredBids = sortOn fst (map (scoreHand . words) $ lines contents)
    let totalWinnings = foldl (\z (rank, (_, bid)) -> z + rank * bid) 0 $ zip [1..] scoredBids
    print totalWinnings
