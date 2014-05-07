import nose
import string

def palindrome(sentence):
    """
    Returns True if string input is a palindrome.
    """
    # remove non-letters
    normal = ''.join([ char for char in sentence.lower() if char in string.ascii_lowercase ])
    center = len(normal) / 2
    left, right = normal[center::-1], normal[center:]
    return left == right

    
def test_discern():
      assert palindrome("A man, a plan, a canal: Panama!") is True
      assert palindrome("Five six seven eight") is False
      assert palindrome("Race Car") is True
      assert palindrome("racecars") is False
