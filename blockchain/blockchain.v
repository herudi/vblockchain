module blockchain

pub struct Blockchain[T] {
pub mut:
	chain []Block[T]
}

pub fn new_blockchain[T](genesis T) Blockchain[T] {
	mut bc := Blockchain[T]{}
	bc.chain << new_block[T](
		index: 0
		timestamp: 0
		prev_hash: '0'
		data: genesis
	)
	return bc
}

pub fn (mut bc Blockchain[T]) add_block(new Block[T]) {
	nb := new_block[T](Block[T]{ ...new, prev_hash: bc.latest_block().hash })
	if bc.is_block_valid(nb) {
		bc.chain << nb
	}
}

pub fn (mut bc Blockchain[T]) latest_block() Block[T] {
	return bc.chain[bc.chain.len - 1]
}

pub fn (mut bc Blockchain[T]) is_latest_block(block Block[T]) bool {
	return bc.latest_block().hash == block.hash
}

pub fn (mut bc Blockchain[T]) all_block() []Block[T] {
	return bc.chain
}

pub fn (mut bc Blockchain[T]) is_block_valid(next Block[T]) bool {
	last := bc.latest_block()
	return next.index == (last.index + 1) && next.prev_hash == last.hash
		&& next.hash == next.calculate_hash()
}
