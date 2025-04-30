import pytest


def test_get_fizzbuzz_ep(client):
    response = client.get("/fizzbuzz/5")
    assert 'Buzz' in response.text
