-- Emma Markle 

mySort :: (Ord a) => [a] -> [a]
mySort = foldr insertSorted []

insertionSort :: (Ord a) => a -> [a] -> [a]
insertionSort x xs = takeWhile (<= x) xs ++ [x] ++ dropWhile (<= x) xs

