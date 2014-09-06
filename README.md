# Logo turtle / Toy robot simulator

This Ruby application is a simple implementation of a
[Logo turtle](http://en.wikipedia.org/wiki/Turtle_graphics).

Incidentally it's also called a 'Toy robot simulator'.

The robot/turtle accepts the following commands: `PLACE`,
`MOVE`, `LEFT`, `RIGHT` and `REPORT`.

Commands can be passed in via a STDIN input.


## Installation

Just clone the repository locally.


## Running

```bash
ruby runner.rb
```

or with file input:

```bash
ruby runner.rb < commands.txt>
```


## Running specs

```bash
bundle install
rspec
```

or

```bash
bundle install
guard init
guard
```


Copyright © 2014 Paweł Gościcki, released under the MIT license
