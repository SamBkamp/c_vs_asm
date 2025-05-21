# C is already considered one of the most efficient languages out there but what if I could beat it anyway?
I decided it would be fun to write a program both in c and in x86 (i385) assembler (using nasm) to compare them.



## was it better?
yes, very. Before even getting into runtime analysis, the assembler takes up significantly less space on disk:

- *a.out* (asm binary) : 8796 bytes
- *c.out* (dynamically linked c binary) : 16008 bytes
- *s.out* (statically linked c binary) : 762320 bytes

compared to the dynamically linked c binary, the assembler binary is a whole *45%* smaller in disk, but that's not even a fair fight because the binary still makes calls to other compiled binaries that aren't counted here but still would be required to have on disk to run. Compared to the statically linked c binary its **98.8%** smaller. 2 whole orders of magnitude smaller than the statically linked c program.

Now given this, I still don't know how Wozniak fit Wozmon in 254 bytes of data...

### Runtime
according to valgrind, the c binaries used 1,024 bytes of heap data, while my assembly program runs entirely in the stack and registers. According the to the `time` command, the c binaries took 3s of real time while the assembly program only took 2s. Still a nice 33% reduction in execution time. 



## Why aren't all programs written like this?
It took me 2 minutes to write that c program, it took me 4 hours to hammer out the assembly program (now granted im a lot more fluent in C than in asm).
