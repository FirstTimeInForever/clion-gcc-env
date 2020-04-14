#!/bin/bash

docker run --cap-add sys_ptrace -p127.0.0.1:2222:22 --name clion-env clion-env
