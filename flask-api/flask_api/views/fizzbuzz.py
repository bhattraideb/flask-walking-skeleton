"""Acceptance Criteria:
It has one endpoint `GET /` that takes a single integer as its query parameter.
When the integer is divisible by 3 the endpoint returns `Fizz`
When the integer is divisible by 5 the endpoint returns `Buzz`
When the integer is divisible by both 3 and 5 the endpoint returns `FizzBuzz`
When the integer passed is not divisible by either 3 or 5 the endpoint returns the integer"""


def division_by_3(n):
    return n % 3 == 0


def division_by_5(n):
    return n % 5 == 0


def check_fizzbuzz(n):
    """This fucntion check whether given integer is divisible by 3 and 5 and returns fizz, buzz or fizzbuzz if
    divisible by both 3 and 5 otherwise it will return integer itself"""
    if division_by_3(n) and division_by_5(n):
        return 'FizzBuzz'
    if division_by_3(n):
        return 'Fizz'
    if division_by_5(n):
        return 'Buzz'

    return n
