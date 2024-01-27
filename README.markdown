<h1 align="center"><i>✨ pysmaz2 ✨ </i></h1>

<h3 align="center">The python binding for <a href="https://github.com/antirez/smaz2">smaz2</a> </h3>

[![pypi](https://img.shields.io/pypi/v/pysmaz2.svg)](https://pypi.org/project/pysmaz2/)
![python](https://img.shields.io/pypi/pyversions/pysmaz2)
![implementation](https://img.shields.io/pypi/implementation/pysmaz2)
![wheel](https://img.shields.io/pypi/wheel/pysmaz2)
![license](https://img.shields.io/github/license/synodriver/pysmaz2.svg)
![action](https://img.shields.io/github/workflow/status/synodriver/pysmaz2/build%20wheel)

### install
```bash
pip install pysmaz2
```


### Usage
```python
def compress(inp: bytes, bufsize: int) -> bytes: ...
def compress_into(inp: bytes, out: bytearray) -> int: ...
def decompress(inp: bytes, bufsize: int) -> bytes: ...
def decompress_into(inp: bytes, out: bytearray) -> int: ...
```