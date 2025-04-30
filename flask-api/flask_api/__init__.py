__version__ = '0.1.0'

import os

from flask import Flask, render_template

from.views.fetch_host import fetch_details
from .views.hello_world import hello_world, health_check
from .views.fizzbuzz import check_fizzbuzz
from .views.prime_number import check_prime, sum_of_primes
from .views.fibonacci import generate_fibonacci, check_if_number_is_fibonacci


def create_app():
    app = Flask(__name__)

    @app.route('/')
    def home():
        return hello_world()

    @app.route('/details')
    def details():
        host_name, ip_address = fetch_details()
        return render_template('index.html', hostname=host_name, ipaddress=ip_address)

    @app.route('/health')
    def health():
        return health_check()

    @app.route('/fizzbuzz/<int:number>')
    def fizzbuzz_check(number):
        return check_fizzbuzz(number)

    @app.route('/prime/<int:number>')
    def prime_check(number):
        if check_prime(number):
            return 'Yes'
        return 'No'

    @app.route('/prime/<int:list>')
    def sum_of_prime_numbers(numbers):
        total = sum_of_primes(numbers)
        return render_template('index.html', sum=total, ipaddress=numbers)

    @app.route('/fibonacci/check/<int:number>')
    def fibonacci_check(number) -> str:
        if check_if_number_is_fibonacci(number):
            return 'Yes'
        return 'No'

    @app.route('/fibonacci/generate/<int:number>')
    def fibonacci_generate(number):
        return generate_fibonacci(number)

    return app


if __name__ == '__main__':
    create_app().run(host='0.0.0.0', port=5000, debug=True)
