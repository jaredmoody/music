require 'listen'

listener = Listen.to('/Users/jaredmoody/Music') do |modified, added, removed|
  puts(modified: modified, added: added, removed: removed)
end

listener.start
sleep
