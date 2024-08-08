-- Emma Markle
-- This code builds a list showing which pages each word appears on in a collection of pages
-- example: pages = [["hello", "world", "foo"], 
        -- ["bar", "foo", "hello"], 
        -- ["baz", "qux", "foo"]]
        
included :: Eq a => a -> [a] -> Bool
included x xs = any (== x) xs

checkUnique :: String -> [String] -> [String]
checkUnique x acc | included x acc = acc
                  | otherwise = x : acc

uniqueWords :: [[String]] -> [String]
uniqueWords pages = foldr (\x acc -> checkUnique x acc) [] (concat pages)

occurrences :: String -> [[String]] -> (String, [Int])
occurrences word pages = (word, [i + 1 | (i, page) <- zip [0..] pages, included word page])

invertedIndex :: [[String]] -> [(String, [Int])]
invertedIndex pages = concatMap (\word -> [occurrences word pages]) (uniqueWords pages)



