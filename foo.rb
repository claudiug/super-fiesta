# require 'concurrent'
#
# p = Concurrent::Promise.execute do
#   42
# end
#
# puts p.state
# p.execute
# puts p.state
# puts p.value
#
# puts p1 = Concurrent::Promise.new do
#   10
# end.then do |x|
#   x * 100
# end.then do |result|
#   result - 10
# end.execute

# puts p1.realized?
# puts p1.value
# puts p1.state

require 'jwt'

payload = {:data => 'claudiu'}
#
# token = JWT.encode payload, nil, 'none'
#
# puts token
# decoded_token = JWT.decode token, nil, false
#
# puts decoded_token
hmac_secret = 'claudiu'

token = JWT.encode payload, hmac_secret, 'HS256'

puts token
decoded_token = JWT.decode token, hmac_secret, true, { :algorithm => 'HS256' }

puts decoded_token