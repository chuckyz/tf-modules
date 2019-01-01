# AWS Instance(s) module

EC2 instances can sporadically die (not common, but it happens) and have no auto recovery without a setup of it.  Using an ASG with min/max/desired of 1 fixes that, and ASGs themselves are free.

This can also be used to just outright manage an ASG.