import math


def check_prime(n) -> str:
    """
    A prime number is a natural number greater than 1 that is not a product of two smaller natural numbers.
    A natural number greater than 1 that is not prime is called a composite number.
    :param n:
    :return: True/False
    """
    if n < 2:
        return False
    for i in range(2, math.floor(math.sqrt(n) + 1)):
        if n % i == 0:
            return False
    return True


def sum_of_primes(numbers):
    return sum([x for x in numbers if check_prime(x)])
