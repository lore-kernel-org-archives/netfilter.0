From: Phil C <flah@hell.com>
Subject: help accepting unbound addresses
Date: Fri, 14 May 2004 20:29:08 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040515002908.GU78829@adsl195.cofs.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I am using iptables-1.2.8, iproute-2.4.7 and kernel-2.4.25 (stock except
new e1000 driver) running on redhat-7.3.

I have a machine running stunnel on 0.0.0.0:443, which has a private address
(192.168.1.1) and a public address (1.2.3.4). I want to accept port 443 traffic
for an unbound subnet (12.12.12.0/24). Generally speaking this would be easy
enough, simply bind the subnet to the loopback.. But there are other
constraints...

I have made some modifications to stunnel. First, stunnel now uses
getsockname() to determine what cert to load from the file system. This means
that I can't use destination nat'ing, because I need the destination IP to
remain in tact. The second complication is that I have added a new option to
stunnel which allows it to connect back to the original destination address (ie
12.12.12.3), but on port 80. This means that the subnet can't be on the
loopback, because when stunnel tries to reconnect to port 80 the request will
be seen as local and it won't get back to the proper box (no http process on my
stunnel box).

My attempts to have the packet accepted locally and routed back out of the
stunnel box have thus far been fruitless. I tried using tproxy, but of course,
that modifies the destination address. I have also tried the following:

iptables -t mangle -A PREROUTING -j MARK -i eth0.26 -p tcp --dport 443 --set-mark 0xa
ip rule add prio 10 fwmark 10 table 10
ip route add 0/0 dev lo table 10

The packets make it to the stunnel machine, but the client only receives
icmp time exceeded in-transit.

I also tried this

iptables -t mangle -A PREROUTING -j MARK -p tcp --dport 80 --set-mark 0x14
ip rule add prio 20 fwmark 20 table 20
ip route add 0/0 via [DEFROUTE] table 20

This yields the same result as the above.

Soooo... is it possible to accept packets for an unbound IP, without
modifying the original destination address? If nothing exists right now
to do such a thing, are there any projects/features which could be modified
to accomodate these requirements? I've exhausted my knowledge base trying
to solve this problem. Any tips hints... anything would be helpful.

Thanks

-- 
<flah@hell.com>
0x68616c666

