From: David Gowdy <receiver@gowdygroup.net>
Subject: Cannot get Netfilter to forward to port 80
Date: Mon, 9 Feb 2009 16:15:40 -0500
Message-ID: <3803f73b0902091315g2425fa11s7174c4f3ca9d4a39@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-2022-jp"
To: netfilter@vger.kernel.org

I'm using a Linux system running Netfilter a the primary gateway for
my Internet service.  This includes the use of port forwarding (DNAT)
for accessing some servers.  Right now the servers include FTP (port
21) and HTTP/HTTPS (port 80/443).  It all seems to work nicely with
one notable exception.  I cannot forward anything to port 80.  I've
tried using several different external ports (i.e., 21, 60, 81) but
nothing works.  Verizon is blocking port 80.  Therefore, it does no
good to try it.  If I change my HTTP server to listen on port 60
instead of 80 everything works fine.

I've run network analyzers on both the external (WAN) interface as
well as the LAN segment on which the destination servers are located.
This has confirmed that packets addressed to the respective ports are
being received on the WAN interface but in the case where I attempt
forwarding to port 80 nothing appears on the internal LAN segment.  My
conclusion is that Netfilter is doing something different when 80 is
specified as the target port for DNAT.

Can anyone explain what is going on?

Here is a list showing one configuration of iptables that I tried as
described above (try to forward port 81 to port 80) →

Chain INPUT (policy DROP)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere
ACCEPT     all  --  10.0.0.0/24          anywhere
drop-and-log-it  all  --  10.0.0.0/24          anywhere
ACCEPT     icmp --  anywhere
pool-71-163-168-209.washdc.fios.verizon.net
ACCEPT     all  --  anywhere
pool-71-163-168-209.washdc.fios.verizon.netstate RELATED,ESTABLISHED
ACCEPT     tcp  --  anywhere
pool-71-163-168-209.washdc.fios.verizon.netstate
NEW,RELATED,ESTABLISHED tcp dpt:ssh
drop-and-log-it  all  --  anywhere             anywhere

Chain FORWARD (policy DROP)
target     prot opt source               destination
ACCEPT     tcp  --  anywhere             anywhere           tcp
dpt:ftp state NEW,RELATED,ESTABLISHED
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:81
state NEW,RELATED,ESTABLISHED
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:60
state NEW,RELATED,ESTABLISHED
ACCEPT     tcp  --  anywhere             anywhere           tcp
dpt:https state NEW,RELATED,ESTABLISHED
ACCEPT     all  --  anywhere             anywhere           state
RELATED,ESTABLISHED
ACCEPT     all  --  anywhere             anywhere
drop-and-log-it  all  --  anywhere             anywhere

Chain OUTPUT (policy DROP)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere
ACCEPT     all  --  pool-71-163-168-209.washdc.fios.verizon.net
10.0.0.0/24
ACCEPT     all  --  10.0.0.0/24          10.0.0.0/24
drop-and-log-it  all  --  anywhere             10.0.0.0/24
ACCEPT     all  --  pool-71-163-168-209.washdc.fios.verizon.net
anywhere
drop-and-log-it  all  --  anywhere             anywhere

Chain drop-and-log-it (5 references)
target     prot opt source               destination
DROP       all  --  anywhere             anywhere
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination
DNAT       tcp  --  anywhere
pool-71-163-168-209.washdc.fios.verizon.nettcp dpt:ftp to:10.0.0.12:21
DNAT       tcp  --  anywhere
pool-71-163-168-209.washdc.fios.verizon.nettcp dpt:81 to:10.0.0.12:80
DNAT       tcp  --  anywhere
pool-71-163-168-209.washdc.fios.verizon.nettcp dpt:60 to:10.0.0.12:21
DNAT       tcp  --  anywhere
pool-71-163-168-209.washdc.fios.verizon.nettcp dpt:https
to:10.0.0.12:443

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
SNAT       all  --  anywhere             anywhere           to:71.163.168.209

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination
