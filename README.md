# nut-cgi
This is a basic docker with `nut-cgi` and `lighttpd` from `debian:latest`.
You need to provide a `hosts.conf` (example bellow), the container will listen on port `80`.

Example run command:
`docker create --name=nut -p 8000:80 -v /path/to/hosts.conf:/etc/nut/hosts.conf --restart unless-stopped danielb7390/nut-cgi`

Example `hosts.conf` from nut package:
```
# Network UPS Tools: example hosts.conf
#
# This file is used to control the CGI programs.  If you have not
# installed them, you may safely ignore or delete this file.
#
# -----------------------------------------------------------------------
#
# upsstats will use the list of MONITOR entries when displaying the
# default template (upsstats.html).  The "FOREACHUPS" directive in the
# template will use this file to find systems running upsd.
#
# upsstats and upsimage also use this file to determine if a host may be
# monitored.  This keeps evil people from using your system to annoy
# others with unintended queries.
#
# upsset presents a list of systems that may be viewed and controlled
# using this file.
#
# -----------------------------------------------------------------------
#
# Usage: list systems running upsd that you want to monitor
#
# MONITOR <system> "<host description>"
#
# Examples:
#
# MONITOR myups@localhost "Local UPS"
# MONITOR su2200@10.64.1.1 "Finance department"
# MONITOR matrix@shs-server.example.edu "Sierra High School data room #1"
```