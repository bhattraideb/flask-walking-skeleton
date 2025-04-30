import pytest


def test_prime_1(client):
    response = client.get("/prime/1")
    assert response.text == 'No'


def test_prime_5(client):
    response = client.get("/prime/5")
    assert response.text == 'Yes'


def test_prime_29(client):
    response = client.get("/prime/29")
    assert response.text == 'Yes'


def test_prime_37(client):
    response = client.get("/prime/37")
    assert response.text == 'Yes'


def test_prime_49(client):
    response = client.get("/prime/49")
    assert response.text == 'No'


def test_prime_25(client):
    response = client.get("/prime/25")
    assert response.text == 'No'


# def test_sum_of_primes_mixed_list():
#     assert sum_of_primes([11, 15, 17, 18, 20, 100]) == 28

