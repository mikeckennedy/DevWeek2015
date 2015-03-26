def find_numbers(predicate):
    nums = []

    for n in range(0, 100):
        if predicate(n):
            nums.append(n)

    return nums


print(find_numbers(lambda n: n % 11 == 0))
