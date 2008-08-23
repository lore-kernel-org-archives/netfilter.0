From: bsilva <bsilva@sonic.net>
Subject: Policy routing issue
Date: Fri, 22 Aug 2008 17:57:24 -0700 (PDT)
Message-ID: <Pine.LNX.4.58.0808221753320.23246@bolt.sonic.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org


I'm having an unusual problem with a Policy Routing setup.  I have a
combination of IPtables and Policy Routing rules that force certain
protocols out one interface and other protocols out the other interface.
The problem is that SNMP traps are exiting the correct interface, but
with the IP address of the other interface!

Furthermore, the situation only occurs if the destination is not local.
If the destination is local, the packet exits the correct interface with
the correct source IP.  If the destination is via a gateway, then the
packet exits via the correct interface, but with the wrong source IP.

I'm at a loss.  The rules and routes all appear to work correctly, it's
just the final assignment of the source IP that seems to be wrong.  It
appears to me that I've found a bug in the kernel, but I'm not sure.  Any
clues or further things to look at would be very helpful.


Thanks in advance,
Brad

---------------------------------------------------

I'm running kernel 2.6.16.55 on a custom distribution.

Here's the route rules and route tables: (I've simplified the setup for
this problem)

$ iptables -L -t mangle
Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination
MARK       tcp  --  anywhere             anywhere            tcp dpt:162
MARK set 0x1

$ ip rule list
0:	from all lookup 255
2000:	from all fwmark 0x1 lookup 1
32766:	from all lookup main
32767:	from all lookup default

(I know that route table 1 is being selected since I can change these
routes and the result changes as expected)
$ ip route list table 1
192.168.105.0/24 dev bond2  scope link  src 192.168.105.79
default via 192.168.105.6 dev bond2  src 192.168.105.79

(note that even though the route specifies a "src 192.168.105.79" and
the cache entry shows the correct "via" address, the "from" address is
192.168.123.79!)
$ ip route list cache
....
192.168.100.254 from 192.168.123.79 via 192.168.105.6 dev bond2
    cache  (null) 1500 ssthresh 1460 advmss 64
....





