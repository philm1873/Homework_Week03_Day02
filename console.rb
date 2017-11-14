require_relative('models/bounty.rb')

alien1 = Bounty.new({
  'name' => 'Predator',
  'species' => 'Yautja',
  'bounty' => '2500',
  'danger_level' => 'High'
  })

alien2 = Bounty.new({
    'name' => 'Alien',
    'species' => 'Xenomorph',
    'bounty' => '1000',
    'danger_level' => 'Medium'
    })

alien2 = Bounty.new({
  'name' => 'E.T.',
  'species' => 'Brodo Asogian',
  'bounty' => '10000',
  'danger_level' => 'High'
  })

  alien1.save

  alien1.bounty = 100
  alien1.update

  alien2.save

  alien2.name = 'Queen'
  alien2.update

  # alien1.delete

  alien_to_be_deleted = Bounty.find(2)

  alien_to_be_deleted.delete
