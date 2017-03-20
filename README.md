# pry-try

Open a pry-session with the gems you want to try.  

## Usage

* start a pry-session with one or more gems loaded:

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
    $ pry-try activesupport '~>4.2'
    ...
    [2] pry(main)>
    ```
        
    Multiple gems:
    
    ```bash
    $ pry-try activesupport '~>4.2' redis
    ...
    [2] pry(main)>
    ```
    
* start pry-session from within pry:

    ```bash
    $ pry
    [1] pry(main)> .pry-try activesupport
    ...
    [2] pry(main)> 
    This session is isolated from the initial session.
    ^d to return to initial session
    ```
    
* pipe-in script and start a pry-session:

    ```bash
    $ echo '@a = 1' | pry-try
    [1] pry(main)> @a
    => 1
    [2] pry(main)> 
    
    # handy when sharing code with others:
    $ curl https://gist.githubusercontent.com/eval/76955c57512c1e4ac01cdd913b76c92d/raw/bf714a15789eca3e968c3544f85b9b786b8eae8f/hello.rb | pry-try
    
    # or via the gist command:
    $ gist -r 76955c57512c1e4ac01cdd913b76c92d | pry-try
    ```
    
    **NOTE:** curl-pipe-runtime is [not without risk](https://www.idontplaydarts.com/2016/04/detecting-curl-pipe-bash-server-side/). [vipe](https://github.com/madx/moreutils/blob/master/vipe) ([npm variant](https://github.com/juliangruber/vipe#vipe)) is highly recommended to first view the code that is about to be executed.


## Installation

Install system-wide:

    $ gem install prytry


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

