# ish

<!-- [![Gem Version](https://badge.fury.io/rb/ish.png)](http://badge.fury.io/rb/ish) -->
[![Build Status](https://secure.travis-ci.org/spilliton/ish.png?branch=master)](http://travis-ci.org/spilliton/ish)
[![Code Climate](https://codeclimate.com/github/spilliton/ish.png)](https://codeclimate.com/github/spilliton/ish)

Ish is a ruby gem that when random 'fuzzy' numeric results are desired.  Some quick examples:

``` ruby
1000.ish # => 996
1000.ish # => 1002
1000.ish(plusminus: 500) # => 666
1000.ish(precision: 0.01) # => 666
(1.0).ish # => 0.93
(1.0).ish # => 0.98
```

And with active support:

``` ruby
2.hours.ish # => 7215 seconds
2.hours.ish # => 7201 seconds
1.day.ago # => 
1.day.ish.ago # => 
```


## Install

``` ruby
# Add the following to you Gemfile
gem 'ish'

# Update your bundle
bundle install
```

## Usages
