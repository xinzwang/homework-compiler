import time

def qsort(a,l,r):
    if l>=r:
        return
    i = l
    j = r
    x = a[l]
    while i<j:
        while i<j and x <= a[j]:
            j -= 1
        a[i] = a[j]

        while i<j and a[i] < x:
            i += 1
        a[j] = a[i]

    a[j] = x
    qsort(a,l,j-1)
    qsort(a,j+1,r)
    return


if __name__ =="__main__":
    a = []
    # Read data file
    fp = open("5000000.txt","r")
    num = int(fp.readline())
    a = fp.read().split(' ')
    for i in range(num):
        a[i] = int(a[i])
    a.pop()

    # Print Before sort
    print("Before sort(top 10): ", end = '')
    print(a[0:10])

    # Sort
    print("\nStart")
    st = time.time()
    qsort(a,0, num-1)
    et = time.time()
    print("Finish!\n")

    # Print After sort
    print("After sort(top 10): ",end='')
    print(a[0:10])
    print("\nrun time: ",et-st)
