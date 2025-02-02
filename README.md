# bos
Bob Operating System

Build
-----

  rm -rf build && cmake -S . -B build && cmake --build build

vi /home/rrose/src/bos/build/external-lwip-prefix/src/external-lwip/src/apps/snmp/snmp_traps.c
ln -s /home/rrose/src/bos/build/external-lwip-prefix/src/external-lwip/src/include/lwip/opt.h /home/rrose/src/bos/build/external-lwip-prefix/src/external-lwip/contrib/examples/example_app/lwipcfg.h
vi /home/rrose/src/bos/build/external-lwip-prefix/src/external-lwip/contrib/examples/example_app/test.c
cmake --build build

