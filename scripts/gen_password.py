# import the hash algorithm
from passlib.hash import sha256_crypt
import os

# generate new salt, and hash a password
text = os.environ['SCALABLE_WP_SYSTEM_ROOT_PW']
hash = sha256_crypt.encrypt(text)
print hash

text = os.environ['SCALABLE_WP_SYSTEM_DEPLOY_PW']
hash = sha256_crypt.encrypt(text)
print hash