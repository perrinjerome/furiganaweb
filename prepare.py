import urllib.request
import shutil
import tempfile
import tarfile
import hashlib

with urllib.request.urlopen(
        'https://github.com/perrinjerome/furiganaweb/raw/master/vendor/mecab.tar.gz') as response:
    data = response.read()
    assert hashlib.md5(data).hexdigest() == '5e8d60157233b050fa3b9088f7a0512e'
    with tempfile.NamedTemporaryFile() as tmp_file:
        tmp_file.write(data)
        tmp_file.flush()

        tar = tarfile.open(tmp_file.name)
        tar.extractall(path="/")

