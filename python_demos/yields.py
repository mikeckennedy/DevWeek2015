import time


def get_fib():
    current = 0
    nxt = 1

    while True:
        print("generating next item...")
        time.sleep(1)
        nxt, current = current + nxt, nxt
        yield current


print("calling fibs")
f = get_fib()
print("done calling fibs")

for n in f:
    print("Printing item")
    print(n)

    if n > 200:
        break