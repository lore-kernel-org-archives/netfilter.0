From: ulmo@sonic.net
Subject: How to route per process?
Date: Sat, 20 Jun 2009 19:10:58 -0700 (PDT)
Message-ID: <3cda010470e818a0d5c1c025716ded6e.squirrel@webmail.sonic.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: ulmo@sonic.net

How do I route per process?  I found
<http://blog.sebastien.raveau.name/2009/04/per-process-routing.html>, but
when the packets come back, the local process gets them.  I think the
problem is that "netstat -an" shows the packets in the hostwide default
address, but the packets coming back are for the correct new #.

I've tried a bunch of things, but none of them work.  How do I further
diagnose this, and does anybody know how to do it?

The goal is analagous to getting a second computer and running the process
in that computer with a seperate interface as desired, but the difference
between the analogy and what I'm trying to accomplish is sans the actual
second computer:  i.e., to do it virtually.  I definately do not want to
use vmware, since there are all sorts of overhead inefficiencies with
that.

The software in question has the capability to bind to specified
addresses, but not to send packets out over specified interfaces, which is
necessary.

Here's a copy of the script I have run which doesn't work (numbers
anonymized):

dev=eth3
ifaceaddr=$(ip a s dev $dev |egrep 75|sed -e 's%.* inet \([^/]*\)/.*%\1%')
if [ "$ifaceaddr" = "" ];then ifaceaddr=75.1.2.3;fi
gw=75.1.1.1

iptables -t mangle -A OUTPUT -m owner --uid-owner asterisk -j MARK
--set-mark 42 &&
iptables -t nat -A POSTROUTING -o $dev -m mark --mark 42 -j SNAT
--to-source $ifaceaddr &&
ip rule add fwmark 42 table 42 &&
ip route add default via $gw dev $dev table 42

To wit, all the above works, except that when the packets come back, the
process in question doesn't receive them.  tcpdump shows everything
working as desired up to that point:  the packets go out, they get
responses which come back.  The disconnect is somewhere between the return
packets coming back and them being put into the process's connection as
desired inside the OS, I'm pretty sure.  tcpdump is being run in the local
machine on the interface in question (eth3), so yes, "coming back" means
it reaches the right computer and gets inside it to the point tcpdump sees
it clear as day, with the destination address = the source address, as
modified to use that interface, obviously (else how would it get there).

Debugging tools desired could be to see what SNAT is doing to the return
packets, and/or to see what packet to process debugging could be done.  I
don't know about those types of tools.

