# cython: language_level=3
# cython: cdivision=True
cdef extern from "smaz2.h" nogil:
    unsigned long smaz2_compress(unsigned char *dst, unsigned long dstlen, unsigned char *s, unsigned long len_)
    unsigned long smaz2_decompress(unsigned char *dst, unsigned long dstlen, unsigned char *c, unsigned long len_)