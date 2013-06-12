hash = {"overlay"=>1, "screen"=>2}

randomFilter = hash.keys.sample
puts randomFilter

returnHash = {randomFilter => hash[randomFilter] }

puts returnHash
puts returnHash.values.first
