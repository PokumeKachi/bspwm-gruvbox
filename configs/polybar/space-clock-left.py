#!/bin/env python

# Author    :   unix121
# Github    :   https://github.com/unix121

import re
import time

if __name__=="__main__" :

    limit = 12

    with open( "configs/polybar/spaceclock.txt", 'r+' ) as file:
        line = file.read( )
        line = line.strip( )

        asciiart = '°º¤ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`'

#'[' + time.strftime("%H:%M") + ']' + 
        output = asciiart[int(line):] + asciiart[:int(line)]
        print( output )
        int_line = int( line )
        int_line = int_line - 1

        if int_line == 0:
            int_line = limit

        file.seek( 0 )
        file.write( str( int_line ) )
        file.truncate( )
        file.close( )
