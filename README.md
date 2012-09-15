# GetRunningProcesses

Gets all of the running processes from a linux system using the output of

    ps -ef

## Installation

Add this line to your application's Gemfile:

    gem 'get_running_processes'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install get_running_processes

## Usage

    require 'get_running_processes'

    processes = GetRunningProcesses.collect_processes

    processes.include?('ps -ef')

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
