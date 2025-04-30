import pytest

from flask_api.views.fizzbuzz import check_fizzbuzz


def test_fizzbuzz_3():
    assert check_fizzbuzz(3) == 'Fizz'


def test_fizzbuzz_9():
    assert check_fizzbuzz(9) == 'Fizz'


def test_fizzbuzz_27():
    assert check_fizzbuzz(27) == 'Fizz'


def test_fizzbuzz_5():
    assert check_fizzbuzz(5) == 'Buzz'


def test_fizzbuzz_15():
    assert check_fizzbuzz(15) == 'FizzBuzz'


def test_fizzbuzz_45():
    assert check_fizzbuzz(45) == 'FizzBuzz'


def test_fizzbuzz_25():
    assert check_fizzbuzz(25) == 'Buzz'


def test_fizzbuzz_20():
    assert check_fizzbuzz(20) == 'Buzz'


def test_fizzbuzz_2():
    assert check_fizzbuzz(2) == 2


def test_fizzbuzz_4():
    assert check_fizzbuzz(4) == 4
    