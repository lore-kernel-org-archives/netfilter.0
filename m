From: iptables@trodman.com
Subject: Re: basic NAT/masquerading setup
Date: Thu, 19 Sep 2013 14:34:03 -0500
Message-ID: <201309191934.r8JJY3aW002589@localhost.localdomain>
References: <201309191636.r8JGaUsc027762@localhost.localdomain> <201309191338.57155.neal.p.murphy@alum.wpi.edu>
Return-path: <netfilter-owner@vger.kernel.org>
In-reply-to: <201309191338.57155.neal.p.murphy@alum.wpi.edu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Thu 9/19/13 13:38 EDT neal.p.murphy@alum.wpi.edu wrote:
> On Thursday, September 19, 2013 12:36:30 PM iptables@trodman.com wrote:
> > Hello:
> > 
> > I'm trying to set up simple NAT/masquerading on a dual NIC host
> > (hostname == "psi") running fedora 19, so hosts on my LAN can access
> > Internet by routing thru host "psi".
> > 
> > Interface p1p1 is on my LAN, p2p1 is on Internet.
> > 
> > I got the "design" of below /etc/iptables from another of my older (fedora
> > core 10) hosts, where NAT/masquerading works fine.
> > 
> > Everything but the NAT/masquerading works.
> 
> Perhaps I missed it: where do you ACCEPT *NEW* conns in chain FORWARD?

I'm not knowledgeable enough to defend what I have; may have gotten
the NAT/masquerading lines from a TUI tool or a few web searches,
several years ago.  It is working now though.

If you have a specific addition you recommend, pls go ahead.

--
thanks,
Tom
--
--working version:

/etc/sysconfig root # ls -log  iptables
-rw-------. 1 2376 Sep 19 11:51 iptables
/etc/sysconfig root # cat iptables
# iptables comments apparently require poundsign in column 1

# http://www.netfilter.org/documentation/HOWTO/packet-filtering-HOWTO-7.html
# some comments taken from: http://serverfault.com/questions/84963/why-not-block-icmp

# Firewall configuration written by system-config-firewall

# Internet facing port is p2p1
# LAN: p1p1

*nat
:PREROUTING ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]
-A POSTROUTING -o p2p1 -j MASQUERADE
COMMIT

*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]

# Accept any packets that have something to do with ones we've sent on outbound
-A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
# ESTABLISHED: A packet which belongs to an existing connection
# (i.e., a reply packet, or outgoing packet on a connection which has seen replies).
#
# RELATED: A packet which is related to, but not part of, an existing
# connection, such as an ICMP error, or (with the FTP module
# inserted), a packet establishing an ftp data connection.

# Accept ICMP
-A INPUT -p icmp -j ACCEPT

# Accept any packets coming or going on localhost (this can be very important)
-A INPUT -i lo -j ACCEPT

# trust LAN
-A INPUT -i p1p1 -j ACCEPT

# TBD: do I need these:
-A INPUT -p ah -j ACCEPT
-A INPUT -p esp -j ACCEPT

# --------------------------------------------------------------------
# accept ssh, http, https, mail
# --------------------------------------------------------------------
-A INPUT -m state --state NEW -m tcp -p tcp --dport 22 -j ACCEPT

-A INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT

# https
-A INPUT -p tcp -m state --state NEW -m tcp --dport 443 -j ACCEPT

-A INPUT -p tcp -m tcp --dport 25 -m state --state NEW,ESTABLISHED -j ACCEPT

# --------------------------------------------------------------------
# setup forwarding for nat/masquerading
# --------------------------------------------------------------------
-A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
-A FORWARD -p icmp -j ACCEPT
-A FORWARD -i lo -j ACCEPT

-A FORWARD -i p1p1 -j ACCEPT
-A FORWARD -o p2p1 -j ACCEPT

# reject other traffic
# TBD: reconcile w/ http://www.redhat.com/archives/rhl-list/2009-September/msg01757.html
-A INPUT   -j REJECT --reject-with icmp-host-prohibited
-A FORWARD -j REJECT --reject-with icmp-host-prohibited

-A INPUT -i p1p1 -s 10.164.123.202/255.255.255.0 -j ACCEPT
COMMIT
/etc/sysconfig root # iptables -L -v
Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination
  631 55070 ACCEPT     all  --  any    any     anywhere             anywhere             state RELATED,ESTABLISHED
    4   116 ACCEPT     icmp --  any    any     anywhere             anywhere
    1    84 ACCEPT     all  --  lo     any     anywhere             anywhere
   52  8567 ACCEPT     all  --  p1p1   any     anywhere             anywhere
    0     0 ACCEPT     ah   --  any    any     anywhere             anywhere
    0     0 ACCEPT     esp  --  any    any     anywhere             anywhere
    0     0 ACCEPT     tcp  --  any    any     anywhere             anywhere             state NEW tcp dpt:ssh
    4   196 ACCEPT     tcp  --  any    any     anywhere             anywhere             state NEW tcp dpt:http
    0     0 ACCEPT     tcp  --  any    any     anywhere             anywhere             state NEW tcp dpt:https
    0     0 ACCEPT     tcp  --  any    any     anywhere             anywhere             tcp dpt:smtp state NEW,ESTABLISHED
   42  3892 REJECT     all  --  any    any     anywhere             anywhere             reject-with icmp-host-prohibited
    0     0 ACCEPT     all  --  p1p1   any     10.164.123.0/24      anywhere

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination
15270   13M ACCEPT     all  --  any    any     anywhere             anywhere             state RELATED,ESTABLISHED
    0     0 ACCEPT     icmp --  any    any     anywhere             anywhere
    0     0 ACCEPT     all  --  lo     any     anywhere             anywhere
 1753 84410 ACCEPT     all  --  p1p1   any     anywhere             anywhere
    0     0 ACCEPT     all  --  any    p2p1    anywhere             anywhere
    0     0 REJECT     all  --  any    any     anywhere             anywhere             reject-with icmp-host-prohibited

Chain OUTPUT (policy ACCEPT 2292 packets, 227K bytes)
 pkts bytes target     prot opt in     out     source               destination
/etc/sysconfig root # sysctl net.ipv4.ip_forward
net.ipv4.ip_forward = 1
/etc/sysconfig root # tail /etc/sysctl.conf
# System default settings live in /usr/lib/sysctl.d/00-system.conf.
# To override those settings, enter new settings here, or in an /etc/sysctl.d/<name>.conf file
#
# For more information, see sysctl.conf(5) and sysctl.d(5).
net.ipv4.ip_forward = 1
/etc/sysconfig root # 
