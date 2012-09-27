# GetRunningProcesses

Gets all of the running processes from a linux system using the output of

    ps -ef

## Notes

This is my first gem and is a little bit of a hack job. I plan on polishing it up over time.
If you are using it and have any suggestions - please don't hesitate to contact me.

## Installation

Add this line to your application's Gemfile:

    gem 'get_running_processes'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install get_running_processes

## Usage

The format of the output of 'ps -ef' is as follows:

    UID        PID  PPID  C STIME TTY          TIME CMD
    root         1     0  0 Sep12 ?        00:00:00 /sbin/init

The most simple output:

``` ruby
require 'get_running_processes'

processes = GetRunningProcesses.collect_processes

#=> [["root", "1", "0", "0", "Sep12", "?", "00:00:00", "/sbin/init"]]
```
Other output:

``` ruby
require 'get_running_processes'

processes = GetRunningProcesses.processes

processes.all

#=> [{"UID"=>"root", "PID"=>1, "PPID"=>"0", "C"=>"0", "STIME"=>"09:01", "TTY"=>"?", "TIME"=>"00:00:03", "CMD"=>"/sbin/init"}]

processes.commands

#=> ["/sbin/init"]

processes.commands_with_pids

#=> [{1 => "/sbin/init"}]
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

Copyright (c) 2012 odin (Casey Ellett)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
