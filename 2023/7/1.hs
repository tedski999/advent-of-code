import Data.List

scoreLabel :: Char -> Integer
scoreLabel '2' = 0
scoreLabel '3' = 1
scoreLabel '4' = 2
scoreLabel '5' = 3
scoreLabel '6' = 4
scoreLabel '7' = 5
scoreLabel '8' = 6
scoreLabel '9' = 7
scoreLabel 'T' = 8
scoreLabel 'J' = 9
scoreLabel 'Q' = 10
scoreLabel 'K' = 11
scoreLabel 'A' = 12

handType :: String -> Integer
handType [l1,l2,l3,l4,l5] | l1 == l2 && l2 == l3 && l3 == l4 && l4 == l5 = 6
handType [l1,l2,l3,l4,l5] | (l1 == l2 && l2 == l3 && l3 == l4) || (l2 == l3 && l3 == l4 && l4 == l5) = 5
handType [l1,l2,l3,l4,l5] | (l1 == l2 && l2 == l3 && l4 == l5) || (l1 == l2 && l3 == l4 && l4 == l5) = 4
handType [l1,l2,l3,l4,l5] | (l1 == l2 && l2 == l3) || (l2 == l3 && l3 == l4) || (l3 == l4 && l4 == l5) = 3
handType [l1,l2,l3,l4,l5] | (l1 == l2 && l3 == l4) || (l1 == l2 && l4 == l5) || (l2 == l3 && l4 == l5) = 2
handType [l1,l2,l3,l4,l5] | l1 == l2 || l2 == l3 || l3 == l4 || l4 == l5 = 1
handType [l1,l2,l3,l4,l5] = 0

scoreHand :: [String] -> (Integer, Integer)
scoreHand [h@[l1,l2,l3,l4,l5], bid] = (score, read bid)
    where score = 13^0 * scoreLabel l5 +
                  13^1 * scoreLabel l4 +
                  13^2 * scoreLabel l3 +
                  13^3 * scoreLabel l2 +
                  13^4 * scoreLabel l1 +
                  13^5 * handType (sort h)

main = do
    contents <- getContents
    let scoredBids = sortOn fst (map (scoreHand . words) $ lines contents)
    let totalWinnings = foldl (\z (rank, (_, bid)) -> z + rank * bid) 0 $ zip [1..] scoredBids
    print totalWinnings
