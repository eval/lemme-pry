# pry-try

*Note* This gem is currently mostly README-ware.

## Usage

This gem should support the following usecases:

### pipe-in a script (works)

```bash
# piped-in content is evaluated after which a repl opens:
$ echo '@a = 1' | pry-try
[1] pry(main)> @a =1
[2] pry(main)> 

# handy to share scripts with others:
$ curl <path-to-raw-gist> | pry-try
```

### try a gem (WIP)

```bash
$ pry-try activesupport
Fetching gem metadata from https://rubygems.org/..............
Fetching version metadata from https://rubygems.org/.
Resolving dependencies...
Using concurrent-ruby 1.0.5
Using i18n 0.8.1
Using minitest 5.10.1
Using thread_safe 0.3.6
Using bundler 1.14.5
Using tzinfo 1.2.2
Using activesupport 5.0.2
=> [Gem::Dependency.new("activesupport", Gem::Requirement.new([">= 0"]), :runtime)]
[2] pry(main)> 1.second
=> 1 second
```

### try a gem within a pry-session (WIP)

```bash
# given 
$ pry
[1] pry(main)> try 'activesupport'
...
[2] pry(main)> 1.second
=> 1 second
```


## Installation

Install system-wide:

    $ gem install prytry


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

