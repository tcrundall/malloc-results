#!/usr/bin/env python
import subprocess

benchmarks = ['cache-thrash', 'cache-scratch', 'linux-scalability', 'threadtest', 'larson']
threads    = [1, 2, 4, 8]
sizes      = [1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024]
machines   = ["mole", "rat"]

for benchmark in benchmarks:
  for machine in machines:
    for threadCount in threads:
      subprocess.call(['./plotGenerator.py', '-b', benchmark, '-t', str(threadCount),
                                             '-m', machine])

    for objectSize in sizes:
      subprocess.call(['./plotGenerator.py', '-b', benchmark, '-s', str(objectSize),
                                             '-m', machine])
