/*
 * simple-robot
 *
 * This is a Ragel state machine for a simple robot written while
 * learning the Ragel syntax.
 *
 * https://github.com/0xebef/ragel-studies
 *
 * License: GPLv3 or later
 *
 * Copyright (c) 2010, 0xebef
 */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

%%{
    machine robot_machine;

    action begin {
        printf("begin\n");
    }

    action r_on {
        printf("+");
    }

    action r_off {
        printf("-");
    }

    action r_step {
        printf("#");
    }

    action r_left {
        printf("<");
    }

    action r_right {
        printf(">");
    }

    action r_sit {
        printf("_");
    }

    action r_stand {
        printf("!");
    }

    action finish {
        printf("\nfinish\n");
    }

    action error {
        printf("error, cs = %i\n", cs);
    }

    on = 'O';
    off = 'F';
    left = 'L';
    step = 'S';
    right = 'R';
    sit = 'D';
    stand = 'U';

    Robot = (
        start: (
            on @r_on -> sitting
        ),

        ready: (
            step @r_step -> ready |
            left @r_left -> ready |
            right @r_right -> ready |
            sit @r_sit -> sitting
        ),

        sitting: (
            off @r_off -> final |
            stand @r_stand -> ready
        )
    ) >begin %finish @!error;

    main := ( Robot )*;
}%%

%% write data;

int main()
{
    const char *p = "OULSSRDF";
    const char *pe = p + strlen(p);
    const char *eof = pe;
    int cs = -1;

%% write init;

%% write exec;

    return EXIT_SUCCESS;
}
