#!/bin/bash
for pid in pgrep mysql-workbench; do pkill $pid; done
