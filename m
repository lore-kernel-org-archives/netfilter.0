From: Bart Matthaei <bart@dreamflow.nl>
Subject: ICMP traffic + iproute + tunnel problems
Date: Wed, 19 May 2004 23:05:13 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040519210513.GF1003@dreamflow.nl>
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

Hi All,

I have the following problem:

I have a tunnel between my home router and my colocated machine.
I use source routing (iproute) to route all traffic coming from my home
network (public ipspace) over the tunnel.

Everything works fine. But when a user traceroutes a host in my home
network, or sends traffic to an unreachable host, all ICMP replies are
coming from the ip address of my cable connection (eth0), which is still
the default route on the home router itself.

I don't want to change the default route to my tunnel for various reasons I
don't want to explain here.

217.170.2.120/29 is my home network.

217.170.2.119 is my local tunnel endpoint.
217.170.2.118 is my remote tunnel endpoint.

I've tried the following:

# this catches all traffic traveling out from eth0 which was originated
# from the tunnel.
iptables -A OUTPUT -t mangle -m conntrack --ctorigdst 217.170.2.120/29 -o eth0 -j MARK --set-mark 1

# This sends all the marked packets to routing table 2. I've also added
# 'nat 217.170.2.119', but it doesn't fix things.
ip ru add fwmark 1 table 2

# This sends the traffic through the tunnel
ip ro add default via 217.170.2.118 dev tunnel src 217.170.2.119 table 2

Ok, all of this works. Except for one thing; the source isn't altered.

So the packets are sent through the tunnel, but the source address is still
the eth0 ip, which can't be routed through the tunnel.

The only logical alternative is SNAT on the OUTPUT chain, which isn't
possible with netfilter at this point.

Is there another way to do this?

Regards,

Bart Matthaei

-- 
Bart Matthaei                    bart@dreamflow.nl 

Sometimes a cigar is just a cigar.
                -- Sigmund Freud

