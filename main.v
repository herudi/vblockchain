import blockchain { new_blockchain }
import time

struct Trx {
	name   string
	amount int
}

fn main() {
	mut bc := new_blockchain(Trx{ name: 'genesis' })

	bc.add_block(
		index: 1
		timestamp: time.now().unix()
		data: Trx{
			name: 'john'
			amount: 12
		}
	)

	bc.add_block(
		index: 2
		timestamp: time.now().unix()
		data: Trx{
			name: 'doe'
			amount: 40
		}
	)

	for block in bc.all_block() {
		println('index => ${block.index}')
		println('timestamp => ${block.timestamp}')
		println('hash => ${block.hash}')
		println('prev_hash => ${block.prev_hash}')
		println('is_latest_block => ${bc.is_latest_block(block)}')
		println('data => ${block.data}\n\n')
	}
}
