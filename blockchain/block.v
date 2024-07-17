module blockchain

import crypto.sha256

@[params]
pub struct Block[T] {
pub:
	index     u64
	timestamp i64
	data      T
pub mut:
	hash      string
	prev_hash string
}

fn (b Block[T]) calculate_hash() string {
	return sha256.hexhash(b.index.str() + b.timestamp.str() + b.data.str().replace('\n', '') +
		b.prev_hash)
}

fn new_block[T](new Block[T]) Block[T] {
	return Block[T]{
		...new
		hash: new.calculate_hash()
	}
}
