import pytest

from flask_api.views.prime_number import check_prime, sum_of_primes


def test_prime_1():
    assert check_prime(1) is False


def test_prime_5():
    assert check_prime(5) is True


def test_prime_29():
    assert check_prime(29) is True


def test_prime_37():
    assert check_prime(37) is True


def test_prime_49():
    assert check_prime(49) is False


def test_prime_25():
    assert check_prime(25) is False


def test_sum_of_primes_mixed_list():
    assert sum_of_primes([11, 15, 17, 18, 20, 100]) == 28

