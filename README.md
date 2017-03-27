# pry-try

Start a pry-session with specific gems or a (remote) script preloaded.

## Usage

This gem allows you to get a pry-session with either...

1. gems preloaded
2. a script preloaded

### pry-session with gems pre-loaded

This requires pry-try to be [installed system-wide](#system-wide).

```bash
$ pry-try activesupport
Fetching gem metadata from https://rubygems.org/.........
Fetching version metadata from https://rubygems.org/.
Resolving dependencies...
Using concurrent-ruby 1.0.5
Using i18n 0.8.1
Using minitest 5.10.1
Using thread_safe 0.3.6
Using coderay 1.1.1
Using method_source 0.8.2
Using slop 3.6.0
Using bundler 1.14.5
Using tzinfo 1.2.2
Using pry 0.10.4
Using activesupport 5.0.2
[2] pry(main)> 1.second
=> 1 second
```
    
Use a specific version:

```bash
# any version notation that is accepted in a Gemfile will work 
$ pry-try activesupport '~> 4.2'
...
[2] pry(main)>
```
        
Multiple gems:
    
```bash
$ pry-try activesupport '~> 4.2' redis
...
[2] pry(main)>
```

### pry-session with script preloaded

Anything piped to pry-try will be evaluated before the pry-session starts:

```bash
$ echo '@a = 1' | pry-try
[1] pry(main)> @a
=> 1
```

```bash
# handy when sharing code with others:
$ curl https://gist.githubusercontent.com/eval/76955c57512c1e4ac01cdd913b76c92d/raw/bf714a15789eca3e968c3544f85b9b786b8eae8f/hello.rb | pry-try

# or via the gist command:
$ gist -r 76955c57512c1e4ac01cdd913b76c92d | pry-try
```
    
**NOTE:** curl-pipe-runtime is [not without risk](https://www.idontplaydarts.com/2016/04/detecting-curl-pipe-bash-server-side/). A tool like [vipe](https://github.com/madx/moreutils/blob/master/vipe) ([npm variant](https://github.com/juliangruber/vipe#vipe)) allows you to inspect the fetched script before handing it over to pry-try.

#### within a (Rails-)project

When the script needs to be evaluated within a project (i.e. use the gems of your project), make sure pry-try is [part of your project](#within-project).

A script for a Rails project would typically look like this:

```ruby
# script.rb
require './config/environment' # load Rails-application
@user = User.first
```

Evaluate via:
```
cat script.rb | bundle exec pry-try
...
[1] pry(main)> @user
#<User id: 1, username: ...
```

## Installation

### System-wide

```bash
$ gem install pry-try
```

### Within project

Add the following to `Gemfile`:
    
```ruby
# Gemfile
gem 'pry-try', group: :development
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

