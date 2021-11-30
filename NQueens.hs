module NQueens where

cartesian :: [a] -> [b] -> [(a, b)]
cartesian xs ys = [(x, y) | x <- xs, y <- ys]

-- (x, y)
board :: Int -> [(Int, Int)]
board n = cartesian [1 .. n] [1 .. n]

remove :: (Int, Int) -> [(Int, Int)] -> [(Int, Int)]
remove (x, y) = filter (\c -> not (sameRow c || sameCol c || sameMajor c || sameMinor c))
  where
    sameRow (x', _) = x' == x
    sameCol (_, y') = y' == y
    sameMajor (x', y') = x' + y' == x + y
    sameMinor (x', y') = x' - x == y' - y

queens' :: [Int] -> Int -> [(Int, Int)] -> Bool
queens' [] _ _ = True
queens' (x : xs) col board
  | coord `notElem` board = False
  | otherwise = queens' xs (col + 1) (remove coord board)
  where
    coord = (x, col)

queens :: Int -> [Int] -> Bool
queens n q = queens' q 1 (board n)
