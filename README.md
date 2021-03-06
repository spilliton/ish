# ish

[![Gem Version](https://badge.fury.io/rb/ish.png)](http://badge.fury.io/rb/ish)
[![Build Status](https://secure.travis-ci.org/spilliton/ish.png?branch=master)](http://travis-ci.org/spilliton/ish)
[![Code Climate](https://codeclimate.com/github/spilliton/ish.png)](https://codeclimate.com/github/spilliton/ish)

Ish is a ruby gem for when random 'fuzzy' numeric/time results are desired.  Some quick examples:

``` ruby
# integers always return integers
100.ish # => 99
100.ish # => 104

# the default precision is 0.05, meaning the plus/minus range (offset)
# is 5% of the input number (so default offset of 100 is 5)
# can override either via params
100.ish(precision: 0.5) # => 135   (50-150 range)
100.ish(offset: 90)     # => 17    (10-190 range)

# floats return floats
(1.0).ish # => 1.0017225780713743  (0.95-1.05 range)
(50.0).ish(precision: 0.5) # => 37.131807291843145
(100.0).ish(offset: 2)     # => 101.44457832200423

# precision can't be calculated from a time object, so we default to offset of 5 minutes
Time.now       # => 2013-07-30 11:55:19 -0500
Time.now.ish   # => 2013-07-30 11:53:33 -0500 (+/- 5 minutes from original time)

# the offset param is in seconds
Time.now.ish(offset: 1000000) # => 2013-07-26 16:31:06 -0500  (+/- 1000000 seconds from original time)

# if the integer would yield an offest less than 1, then 1 is the offset
0.ish  # => 1
0.ish  # => 0
-1.ish # => -2
```

If you use active support, times are even more fun!

``` ruby
2.hours.ish # => 7215 seconds (+/- 6 minutes)
1.day.from_now # => Wed, 31 Jul 2013 16:43:05 UTC +00:00
1.day.ish.from_now # => Wed, 31 Jul 2013 17:50:44 UTC +00:00 (+/- 72 min)
1.hour.ish(offset: 10.minutes).from_now # => Tue, 30 Jul 2013 18:03:20 UTC +00:00 (+/- 10 min)
```


## Install

``` ruby
# Add the following to you Gemfile
gem 'ish'

# Update your bundle
bundle install
```

## Advanced Usage

If you don't care for the default precision or time offsets, you can override either like so:

```ruby
Ish.default_precision = 0.5  # default is 0.05
Ish.default_time_offset_seconds = 100000000000  # default is 300
```

All calls to ish without params will now use those values
