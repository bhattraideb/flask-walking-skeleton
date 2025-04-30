import socket


def fetch_details():
    host_name = socket.gethostname()
    host_ip = socket.gethostbyname(host_name)
    return host_name, host_ip