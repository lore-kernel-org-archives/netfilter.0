From: Brian Aanderud <brian.aanderud@rockwellcollins.com>
Subject: re-routing multicast pkts after mangle table marking
Date: Mon, 23 Mar 2015 15:14:04 -0500
Message-ID: <CAGsPj3=Hchb0VW8nt=4cfKm2pxxnvC7zKyzW1f4sYQmmkXRaMg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>

What must I do to get the multicast frames routed out a 'different'
interface from the default one after applying a fwmark in iptables the
routing table?  I am able to do this with unicast with a combination
of 'ip rule', 'ip route' to a different table, and iptables to apply a
'mark'.  But, the marked multicast frames never seem to follow the
other routing table's routes.

I have two interfaces eth1 and internal0 on different IP subnets.  By
default I route stuff out 'eth1', but I want to route some traffic out
'internal0'.  I plan to use iptables to put a MARK on the pkts I want
to go out 'internal0', then use an 'ip rule' to route it out the other
interface.  I've been doing this for years with unicast data, but now
I want to do it with SOME multicast data.  I'm not running pimd or
anything for true multiple-hop multicast routing/forwarding, I am
simply generating the frames locally and want SOME of them to go out
this other interface, and I want to be able to specify when they go
out by adding/removing iptables rules to mark them.

Here's my ifconfig output for the 2 interfaces:

  eth1    inet addr:192.168.12.100  Bcast:192.168.12.255  Mask:255.255.255.0

  internal0    inet addr:192.168.80.65  Bcast:192.168.80.255  Mask:255.255.255.0

Some info that might be useful from my system:

  $ iptables --version
  iptables v1.4.1.1
  $ uname -a
  Linux ubuntu_node12 2.6.28-18-generic #59-Ubuntu SMP Thu Jan 28
01:23:03 UTC 2010 i686 GNU/Linux


IP routes are shown here - note the default out to a host on 'eth1' --
again, I normally want to use that interface, and only sometimes use
'internal0':

  $ ip route show
  192.168.80.0/24 dev internal0  proto kernel  scope link  src 192.168.80.65
  192.168.12.0/24 dev eth1       proto kernel  scope link  src 192.168.12.100
  default via 192.168.12.1 dev eth1

So, I start sending frames, and they of course go out 'eth1' by
default.  Both unicast and multicast both go out 'eth1' as one would
expect.  Now time to get them re-routed.

In this example I'll mark the frames I want to send out 'internal0'
with fwmark 12 in iptables, and route them using table 12.  I add
iptables rules to mark pkts with destination port 5001 (the iperf
default port) with fwmark 12:

  $ sudo iptables -t mangle -A OUTPUT -p udp --dport 5001 -j MARK --set-mark 12
  $ sudo iptables -t mangle -L OUTPUT -n -v
  Chain OUTPUT (policy ACCEPT 34M packets, 1666M bytes)
   pkts bytes target     prot opt in     out     source
destination
     17 25466 MARK       udp  --  *      *       0.0.0.0/0
0.0.0.0/0           udp dpt:5001 MARK xset 0xc/0xffffffff

I add the 'ip rule' to route those frames using 'table 12':

  $ sudo ip rule add fwmark 12 table 12
  $ sudo ip rule show
  0:      from all lookup local
  32765:  from all fwmark 0xc lookup 12
  32766:  from all lookup main
  32767:  from all lookup default


I add a couple of routes to table 12.  Note I'm explicitly adding a
route to 224.1.1.1 plus a default.  More on that explicit route later.

  $ sudo ip route add default via 192.168.80.2 table 12
  $ sudo ip route add 224.1.1.1/32 dev internal0 table 12
  $ sudo ip route flush cache
  $ sudo ip route show table 12
  224.1.1.1 dev internal0  scope link
  default via 192.168.80.2 dev internal0


Now, I send UNICAST data using iperf.

        iperf -c 192.168.12.1 -u --ttl 10 -b 10k -t 10000

My unicast data now goes out on 'internal0', as expected.  I see the
frames with 'tcpdump' on interface 'internal0'.  They are correctly
"rerouted" to use that interface via table 12 after the mangle chain
sets their fwmark -- and I'm happy that I can force them out the
'wrong' interface (their destination IP is on the subnet that 'eth1'
uses, but I've forced them out 'internal0').

However, now I try sending multicast data using iperf:

        iperf -c 224.1.1.1 -u --ttl 10 -b 10k -t 10000

My multicast data does NOT get re-routed out 'internal0', even though
I can verify with iptables stats that the frames ARE being marked (the
pkt/byte counter going up when I do iptables -L -n -v).  No matter
what I try, the traffic still goes out 'eth1'.  I've tried 'ip route
flush cache', which doesn't help.  Here's what the route cache shows,
even after a cache flush:

  ubuntu_node12 : ~ $ sudo ip route show cache
  multicast 224.1.1.1 from 192.168.12.100 dev eth1
      cache <mc>  mtu 1500 advmss 1460 hoplimit 64
  multicast 224.1.1.1 from 192.168.12.100 dev eth1
      cache <mc>  mtu 1500 advmss 1460 hoplimit 64

I'm watching the 'mark' rule get hit and so I know they're marked in
the mangle table, AFTER I flush the cache, but nothing good happens.
Here are two instances of running 'iptables' to get rule hit counts:

Chain OUTPUT (policy ACCEPT 34M packets, 1670M bytes)
 pkts bytes target     prot opt in     out     source               destination
  144  216K MARK       udp  --  *      *       0.0.0.0/0
0.0.0.0/0           udp dpt:5001 MARK xset 0xc/0xffffffff


Chain OUTPUT (policy ACCEPT 34M packets, 1670M bytes)
 pkts bytes target     prot opt in     out     source               destination
  217  325K MARK       udp  --  *      *       0.0.0.0/0
0.0.0.0/0           udp dpt:5001 MARK xset 0xc/0xffffffff


None of the 60+ frames went out 'internal0'.

I even added the explicit 224.1.1.1/32route through 'internal0' in the
table 12 routing table, as you can see above, to try to get around
this.  Multicast are never 're-routed'.  I have tried adding
masquerade rule, thought it would help, possibly.  But, it doesn't
seem to do anything different.

The only way I've been able to get the multicast frames out
'internal0' is if I put a route in the MAIN routing table that says to
use internal0 for address 224.1.1.1/32.  But even that was funky,
because in order to do that, I had to STOP iperf and RESTART it -- "ip
route flush cache" didn't do the trick to get them re-routed.  It's
like the socket had a cached route that was maintained through a route
cache flush event.  At any rate, using the main table with a route to
this particular interface for 224.1.1.1 isn't really an option I'd
want to pursue, as I have only a subset of 224.1.1.1 frames that I
want routed out 'internal0', with most using 'eth1'.

Thank you for any help you can provide!  Again, this all works fine
with unicast, it's only multicast that won't work.

Thanks!
-Brian
