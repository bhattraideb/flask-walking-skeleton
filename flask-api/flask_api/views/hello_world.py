from flask import jsonify


def hello_world():
    return f"Hello World!"


def health_check():
    return jsonify(
        status="UP"
    )
