From: Jaap Winius <jwinius@umrk.to>
Subject: Re: Advanced routing problem -- solution
Date: Tue, 08 May 2007 14:14:39 +0200
Message-ID: <1178626479.464069af18f07@www.umrk.to>
References: <1178377643.463c9daba4959@www.umrk.to> <463CA718.4060509@rtij.nl>
	<1178392333.463cd70d4571a@www.umrk.to>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1178392333.463cd70d4571a@www.umrk.to>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi all,

To recap, my problem was that I have a Windows server on a private net
behind a firewall and a NAT that I want to make accessible to the world
outside through two different Internet connections simultaneously.
Usually, this is not possible because you have to make a choice with
your default gateway. I discovered how to make a second default gateway
by using advanced routing (iproute), which made it possible for me to
ssh to the firewall via the second Internet connection. However, if
requests via this connection were then forwarded on to the server, its
responses were still being routed out the main default gateway, after
which they would be dropped by the ISP.

The first step towards a solution was to define a second network,
192.168.15.0/24, on the UTP segment that the server was attached to.
Luckily, Windows server 2003 allows you to bind additional IP addresses
to its interfaces. In this case, only the server and the firewall (via
eth1) have addresses on this network.

The next step in my plan didn't work out. I wanted to use the firewall
to mark certain packets coming in (into eth1) from this new network
segment. I thought that this would do the trick:

   iptables -t mangle -A PREROUTING -s 192.168.15.2 -i eth1 \
      -p tcp -j MARK --set-mark 0x1
   iptables -t mangle -A PREROUTING -s 192.168.15.2 -i eth1 \
      -p 47 -j MARK --set-mark 0x1

(192.168.15.2 is the server). These marked packets would then be caught
by iproute and routed according to my secondary routing table:

   ip rule add fwmark 0x1 table secnet prio 990

I hoped that this would send them out via my secondary Internet gateway
(ppp0), but it didn't work. In theory, this kind of configuration will
allow you to route your traffic by protocol (http via one gateway, smtp
via another, etc.).

Anyway, the second half of my eventual solution had nothing to do with
the netfilter and everything to do with iproute. It's simple. Since all
of the packets moving from 192.168/.15.0/24 into the firewall are
responses to requests that arrived via the secondary Internet
connection (and should be sent back that way) anyway, I could use this
one routing rule:

   ip rule add from 192.168.15.0/24 lookup secnet prio 990

This may be less precise than marking the packets (perhaps also
matching the protocol and state), but in my case this second approach
will do and is probably more efficient.

Cheers,

Jaap

