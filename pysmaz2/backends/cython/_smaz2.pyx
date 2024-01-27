# cython: language_level=3
# cython: cdivision=True
from cpython.mem cimport PyMem_Free, PyMem_Malloc
from libc.stdint cimport uint8_t

from pysmaz2.backends.cython.smaz2 cimport smaz2_compress, smaz2_decompress


cpdef inline bytes compress(const uint8_t[::1] inp, unsigned long bufsize):
    cdef unsigned char* buf = <unsigned char*>PyMem_Malloc(<size_t>bufsize)
    if buf == NULL:
        raise MemoryError
    cdef unsigned long outlen = 0
    try:
        with nogil:
            outlen = smaz2_compress(buf, bufsize, <unsigned char *>&inp[0], <unsigned long>inp.shape[0])
        return <bytes>buf[:outlen]
    finally:
        PyMem_Free(buf)

cpdef inline unsigned long compress_into(const uint8_t[::1] inp, uint8_t[::1] out):
    cdef unsigned long outlen = 0
    with nogil:
        outlen = smaz2_compress(<unsigned char *>&out[0], <unsigned long>out.shape[0], <unsigned char *> &inp[0], <unsigned long> inp.shape[0])
    return outlen

cpdef inline bytes decompress(const uint8_t[::1] inp, unsigned long bufsize):
    cdef unsigned char* buf = <unsigned char*>PyMem_Malloc(<size_t>bufsize)
    if buf == NULL:
        raise MemoryError
    cdef unsigned long outlen = 0
    try:
        with nogil:
            outlen = smaz2_decompress(buf, bufsize, <unsigned char *>&inp[0], <unsigned long>inp.shape[0])
        return <bytes>buf[:outlen]
    finally:
        PyMem_Free(buf)

cpdef inline unsigned long decompress_into(const uint8_t[::1] inp, uint8_t[::1] out):
    cdef unsigned long outlen = 0
    with nogil:
        outlen = smaz2_decompress(<unsigned char *>&out[0], <unsigned long>out.shape[0], <unsigned char *> &inp[0], <unsigned long> inp.shape[0])
    return outlen
