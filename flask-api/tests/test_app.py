def test_app(client):
    assert client.get('/').text == f"Hello World!"
