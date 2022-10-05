#ifndef HASH_H_
#define HASH_H_

#include <stddef.h>

/// Calc hash for data
/// @param [in] data Data which need hash
/// @param [in] size Size of data
/// @return Hash of data
unsigned getHash(const void *data, size_t size);

#endif
