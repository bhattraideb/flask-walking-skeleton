import math


# Generate fibonacci factory
def generate_fibonacci_factory(n):
    a = b = 1
    while a <= n:
        yield a
        a, b = a + b, a


def generate_fibonacci(n):
    fibo_series = []
    if n < 0:
        return fibo_series
    if n == 0:
        fibo_series.append(0)
        return fibo_series
    if n == 1:
        fibo_series.append(0)
        fibo_series.append(1)
        return fibo_series
    fibo_series = [0, 1]
    generator_obj = generate_fibonacci_factory(n)
    for item in generator_obj:
        fibo_series.append(item)
    return fibo_series



def is_perfect_square(x):
    s = int(math.sqrt(x))
    return s * s == x
#
# def fibo_gen(n):
#     a = b = 2
#     while a <= n:
#         yield a
#         a, b = a + b, a
#
# def generate_fibonacci(n):
#     result = []
#     if n <= 0:
#         return result
#     if n == 1:
#         result.append(0)
#         return result
#     if n == 2:
#         result.append(0)
#         result.append(1)
#         return result
#     else:
#         result.append(0)
#         result.append(1)
#
#         ######## Using Generator function
#         # fibo_generate = fibo_gen(n)
#         # for i in fibo_generate:
#         #     result.append(i)
#         # return result
#
#     for i in range(2, n):
#         result.append(result[i - 2] + result[i - 1])
#     return result


def check_if_number_is_fibonacci(n):
    # A number is Fibonacci in nature if and only if (5*n2 + 4) or (5*n2 – 4) is a perfect square.
    # if one of 5*n*n + 4 or 5*n*n - 4 or both is a perfect square
    # return is_perfect_square(5 * n * n + 4) or is_perfect_square(5 * n * n - 4)

    generate_fibonacci_numbers = generate_fibonacci(n)
    if n in generate_fibonacci_numbers:
        return True

    return False
