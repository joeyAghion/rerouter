require 'rack/rewrite'

# Expects ENV['REDIRECTS'] to be a ruby hash of source hostnames to destination hostnames. E.g.:
#   "{'old.domain.com' => 'new.domain.com'}"
REDIRECTS = eval(ENV['REDIRECTS'] || '') || {}

use Rack::Rewrite do

  REDIRECTS.each do |from, to|
    r301 %r{.*}, "http://#{to}$&", if: -> (env) { env['SERVER_NAME'] == from }
  end
  
end

# Fall back to default app (empty).
run -> (env) { [200, {}, []] }