# rubydoc_org

Monkey patches `Object#doc` to launch a browser with documentation for
the given class or method from [ruby-doc.org](http://ruby-doc.org).

## ALTERNATIVES

Since this was just a programming exercise to learn Ruby, I'd suggest
using the following instead of this module:

 * ri
 * [looksee](https://github.com/oggy/looksee)
 * [Pry Doc](https://github.com/pry/pry-doc)

## Installation

    $ gem install rubydoc_org

## Usage

Since it monkey-patches `Object`, I would only use it in irb.
With the following in my `.irbrc`:

    require 'rubydoc_org'

Then in IRB I can:

```ruby
irb(main):001:0> ''.doc
# (Opens http://ruby-doc.org/Core-VERSION/String.html in your browser)
=> nil
irb(main):002:0> 1.doc :phase
# (Opens http://ruby-doc.org/Core-VERSION/Numeric.html in your browser)
=> nil
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/eddieantonio/rubydoc_org/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
