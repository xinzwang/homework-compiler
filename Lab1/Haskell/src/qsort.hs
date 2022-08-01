import System.IO

into:: String->Int
into = read

qsort :: (Ord a)=>[a]->[a]
qsort [] =[]
qsort (x:xs)=
    let smaller=[a|a<-xs,a<=x]
        bigger=[a|a<-xs,a>x]
    in qsort smaller ++[x]++qsort bigger

main = do
    --  Read data file
    fp <-openFile "5000000.txt" ReadMode
    cont <- hGetContents fp
    let text = lines cont
    let t2 = text!!1
    let a = map read $words t2::[Int]

    -- Print Before sort
    putStrLn("Before sort(top 3): ")
    print(a!!0)
    print(a!!1)
    print(a!!2)
    putStrLn("")

    -- Sort
    putStrLn("Start")
    let b = qsort(a)
    putStrLn("Finish!")
    putStrLn("")

    -- Print After sort
    putStrLn("After sort(top 3): ")
    print(b!!0)
    print(b!!1)
    print(b!!2)