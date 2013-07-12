# Rerouter

A minimal, rack-based domain-redirecter. Generates 301 redirects from a set of source hostnames to their corresponding destination hostnames while preserving paths and querystrings.

## Steps for setting up your own rerouter on Heroku:

    git clone git@github.com:joeyAghion/rerouter.git
    cd rerouter
    gem install heroku
    heroku apps:create
    git push heroku master
    heroku config:set REDIRECTS="{'old.domain.com'=>'new.domain.com'}"
    heroku domains:add old.domain.com

Then, update the DNS of `old.domain.com` to be a CNAME pointing to the new heroku app.
