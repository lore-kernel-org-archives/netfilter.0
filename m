From: Nick Taylor <nickt@lightlink.com>
Subject: NETMAP nat target and strange traceroutes
Date: Tue, 29 Jun 2004 15:58:53 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.GSU.4.58.0406291347340.29256@adore.lightlink.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I have created a kludge for the ISP I work for to use multiple DSL lines
to bring network service to a remote office.  For various esoteric
reasons, the DSL modems are incapable of directly performing the routing I
need, and I cannot set them into bridged mode.  They can only store a few
routes, and we have many more subnets which need to be routed.  To get
around this limitation, I am using the NETMAP patch to nat all of the
disparte subnets into one contiguous range, 10.23.0.0/16.  Then, there are
some mangle rules, using the random patch to set fwmarks, and some
iproute2 magic to select a gateway based on the random firewall mark.

So, to implement this, there are two linux machines, one on either end of
the DSL lines.  One runs with rules that map the public IP space into the
private space with a destination match, and a prerouting rule, and maps
the private space into the public space with a source match and a
postrouting rule.  The other box has the oposite sense of rules, pre dest
maps private to public, and post source maps public to private.  ASCII art
network map, and sample rules follow:


T3
---------> bond0 ---------> bond0rp ------> rp2 ----> customer
       eth0    eth1      eth0     eth1


I mentioned earlier that there are multiple DSL lines, but I believe that
the issue I'm requesting help with is unrelated, and has only to do
with my use of the NETMAP target.

bond0 has the following rules as a sample:

iptables -t nat -A PREROUTING -d 216.7.11.208/28 -j NETMAP --to 10.23.18.0/28
iptables -t nat -A POSTROUTING -s 10.23.18.0/28 -j NETMAP --to 216.7.11.208/28

and bond0rp has the following for a complementary ruleset:

iptables -t nat -A POSTROUTING -s 216.7.11.208/28 -j NETMAP --to 10.23.18.0/28
iptables -t nat -A PREROUTING -d 10.23.18.0/28 -j NETMAP --to 216.7.11.208/28

Now, this seems to work.  I can ping the machines behind my kludge, and I
can pass data back and forth, at least for ftp and http.  However, if I do
a traceroute from a machine which lives near bond0, I get the following
very strange output:

redhat/root: traceroute -n 216.7.11.209
traceroute to 216.7.11.209 (216.7.11.209), 30 hops max, 40 byte packets
 1  205.232.34.3  2.002 ms  1.62 ms  2.027 ms
 2  207.127.235.1  3.679 ms  1.85 ms  3.426 ms
 3  207.127.235.40  4.402 ms  5.382 ms  3.27 ms
 4  216.7.11.209  3.616 ms  2.978 ms  13.848 ms
 5  216.7.11.209  5.368 ms  23.634 ms  11.483 ms
 6  207.127.233.33  34.556 ms  29.082 ms  20.548 ms
 7  216.7.11.209  6.244 ms  6.158 ms  5.818 ms
 8  216.7.11.209  8.091 ms *  9.082 ms


?!?!

hops 4, 5, and 7 are driving me crazy!  I can only guess that the
connection tracking is grabing hold of my nat, and somehow reverse mapping
"automatically", but I can't figure out what I did wrong to deserve
exactly that behaviour...

Here's a tcpdump showing the traffic from bond0's perspective on eth1, the
traceroute should line up with the tcpdump, if you ignore the first two
hops of the traceroute...

[root@bond0 root]# tcpdump -n -i eth1 icmp and host redhat
tcpdump: listening on eth1
15:51:59.144472 10.42.0.2 > 207.127.235.46: icmp: time exceeded in-transit
15:51:59.150021 10.42.1.4 > 207.127.235.46: icmp: time exceeded in-transit
15:51:59.157632 207.127.233.33 > 207.127.235.46: icmp: time exceeded
in-transit
[tos 0xc0]
15:51:59.179215 10.23.18.1 > 207.127.235.46: icmp: time exceeded
in-transit [tos 0xc0]
15:51:59.208294 10.23.18.1 > 207.127.235.46: icmp: 10.23.18.1 udp port
33441 unreachable [tos 0xc0]

So, the ttl exceeded's from 10.42.0.2, and 10.42.1.4 are from the two DSL
modems (one on either side of the link), and 207.127.233.33 is the eth1
address on bond0rp.  10.23.18.1 is the "mapped" version of 216.7.11.209,
if I'm not mistaken.  I don't understand why it's showing up for rp2, and
for the customer machine, but I figure that's the same reason that
10.42.0.2 AND 10.42.1.4 are BOTH getting translated to 216.7.11.209 on the
way out of bond0.

If anyone can shed some light on the situation I would greatly appreciate
it.

