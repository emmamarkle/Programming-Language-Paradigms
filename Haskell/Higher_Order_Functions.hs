-- Emma Markle

-- Doubles each positive integer in the list
partA :: [Int] -> [Int]
partA = map partAHelper . filter (> 0)

-- Helper function that doubles an integer
partAHelper :: Int -> Int
partAHelper x = x * 2

-- Generates an infinite list starting from 2, where each element is 2 more than the previous one
partB :: [Int]
partB = iterate (+2) 2

-- Generates an infinite list of approximations for the square root of 'num', starting from 'guess'
partC :: Fractional t => t -> t -> [t]
partC num guess = iterate (partCHelper num) guess

-- Helper function to perform one iteration of the Babylonian method for square root approximation
partCHelper :: Fractional t => t -> t -> t
partCHelper num guess = (guess + num / guess) / 2

-- Finds the first pair of consecutive elements in the list where their difference is within the given threshold
partD :: (Num a, Ord a) => [a] -> a -> a
partD list threshold
    | null filteredList = error "No matching elements found"
    | otherwise         = case head filteredList of
                            (_, y) -> y
  where
    filteredList = filter (\(x, y) -> abs (x - y) <= threshold) (zip list (tail list))

-- Computes an approximation of the square root of 'x' until the difference between the square and 'x' is less than 't'
partE :: (Ord t, Fractional t) => t -> t -> [t]
partE x t = takeWhile (\guess -> abs (guess * guess - x) >= t) (iterate (partEHelper x) 1) ++ [partEHelper x (lastElement (takeWhile (\guess -> abs (guess * guess - x) >= t) (iterate (partEHelper x) 1)))]

-- Helper function to perform one iteration of the Babylonian method for square root approximation
partEHelper :: Fractional t => t -> t -> t
partEHelper num guess = (guess + num / guess) / 2

-- Applies each function in the list to the corresponding element in the input list
partF :: [(b -> a)] -> [b] -> [a]
partF fs xs = zipWith (\f x -> f x) fs xs

-- Applies each function in the list to a given value
partG :: a -> [(a -> b)] -> [b]
partG x fs = map (\f -> f x) fs

-- Removes all occurrences of a specified value from the list
partH :: Eq a => a -> [a] -> [a]
partH a as = filter (\x -> x /= a) as

-- Removes all occurrences of elements in the first list from the second list
partI :: Eq a => [a] -> [a] -> [a]
partI list1 list2 = foldr partH list2 list1

-- Splits a list into a list of lists, each one with one fewer element than the previous
partJ :: [a] -> [[a]]
partJ [] = [[]]
partJ xs = takeWhile (\x -> not (null x)) (iterate removeLast xs) ++ [[]]

-- Generates all possible sublists of a given list
partK :: Eq a => [a] -> [[a]]
partK = foldr (\x acc -> acc ++ map (x:) acc) [[]]

-- Removes the last element of a list
removeLast :: [a] -> [a]
removeLast [] = []
removeLast [_] = []
removeLast (x:xs) = x : removeLast xs

-- Retrieves the last element of a list
lastElement :: [a] -> a
lastElement [x]    = x
lastElement (_:xs) = lastElement xs

