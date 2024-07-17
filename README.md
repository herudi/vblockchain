## VBlockchain

A very basic Blockchain implementation in `V`.

### Example
```v
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
		println('data => ${block.data}')
    println('data => ${block.data}')
		println('-'.repeat(block.hash.len) + '\n')
	}
}
```

### Result 
```bash
index => 0
timestamp => 0
hash => 785d3ee45af31e0e792cd3480885b4aa05e6acca7cf3c46ad7a768e147769917
prev_hash => 0
is_latest_block => false
data => Trx{
  name: 'genesis'
  amount: 0
}
----------------------------------------------------------------

index => 1
timestamp => 1721214719
hash => 64098f1dd666bcaba60d745468d083663749ab192e1c4d21e767110dad379d7a
prev_hash => 785d3ee45af31e0e792cd3480885b4aa05e6acca7cf3c46ad7a768e147769917
is_latest_block => false
data => Trx{
  name: 'john'
  amount: 12
}
----------------------------------------------------------------

index => 2
timestamp => 1721214719
hash => 0ca35d6097a685ae4af55635e8af15a433c3a1e52d406f1bf062a29c80bdcaeb
prev_hash => 64098f1dd666bcaba60d745468d083663749ab192e1c4d21e767110dad379d7a
is_latest_block => true
data => Trx{
  name: 'doe'
  amount: 40
}
----------------------------------------------------------------
```