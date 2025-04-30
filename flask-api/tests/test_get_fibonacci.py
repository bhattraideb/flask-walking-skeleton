import pytest


def test_check_fibonacci_0(client):
    response = client.get("/fibonacci/check/0")
    assert response.text == 'Yes'


def test_check_fibonacci_5(client):
    response = client.get("/fibonacci/check/5")
    assert response.text == 'Yes'


def test_check_fibonacci_20(client):
    response = client.get("/fibonacci/check/20")
    assert response.text == 'No'


def test_check_fibonacci_25(client):
    response = client.get("/fibonacci/check/25")
    assert response.text == 'No'


def test_check_fibonacci_22(client):
    response = client.get("/fibonacci/check/22")
    assert response.text == 'No'


def test_check_fibonacci_13(client):
    response = client.get("/fibonacci/check/13")
    assert response.text == 'Yes'


def test_check_fibonacci_21(client):
    response = client.get("/fibonacci/check/21")
    assert response.text == 'Yes'


def test_check_fibonacci_89(client):
    response = client.get("/fibonacci/check/89")
    assert response.text == 'Yes'


def test_generate_fibonacci_5(client):
    response = client.get("/fibonacci/generate/5")
    assert response.text == "[0,1,1,2,3,5]\n"


def test_generate_fibonacci_8(client):
    response = client.get("/fibonacci/generate/8")
    assert response.text == "[0,1,1,2,3,5,8]\n"