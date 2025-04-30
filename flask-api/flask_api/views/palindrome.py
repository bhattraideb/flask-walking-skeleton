def check_palindrome(text) -> bool:
    string_to_test = [c.lower() for c in text if text.isalpha()]
    return string_to_test == string_to_test[::-1]