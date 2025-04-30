import pytest

from flask_api.views.palindrome import check_palindrome

def test_palindrome_racecar_true():
    assert check_palindrome("Racecar") is True


def test_palindrome_rracecar_false():
    assert check_palindrome("RRacecar") is False


def test_palindrome_madam_true():
    assert check_palindrome("Madam, I'm Adam") is True


# def test_palindrome_madam_false():
#     assert check_palindrome("Madam, I'm not Adam") is False


def test_palindrome_bob_true():
    assert check_palindrome("Wow, Bob, wow!") is True


# def test_palindrome_bob_false():
#     assert check_palindrome("Wow, Bob isn't wow!") is False


def test_palindrome_3():
    assert check_palindrome("A man, a plan,  a canal, Panama!") is True
