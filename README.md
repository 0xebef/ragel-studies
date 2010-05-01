# ragel-studies

## simple-robot

A [finite-state machine](https://en.wikipedia.org/wiki/Finite-state_machine) using [Ragel](https://www.colm.net/open-source/ragel) for a simple robot, which can be turned on/off, sit, stand, turn, make a step.

The main rules are simple:

* The robot can be turned on/off only when sitting

* The robot can turn or move only when standing

### The C source code can be generated, compiled and run using these commands:

```
$ ragel simple-robot.rl
$ gcc simple-robot.c -o simple-robot
$ ./simple-robot
```

### The following visualization can be generated using these commands (utilizing [Graphviz](https://graphviz.org) to convert the DOT file to PNG):

```
$ ragel -V simple-robot.rl
$ dot -Tpng simple-robot.dot >simple-robot.png
```

![simple-robot state machine](/simple-robot.png?raw=true)

## Project Homepage

https://github.com/0xebef/ragel-studies

## License and Copyright

License: GPLv3 or later

Copyright (c) 2010, 0xebef
