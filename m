From: "dravya" <dravya@magma.ca>
Subject: RE: Masqureading issues... packets go over wrong link
Date: Fri, 13 Aug 2004 16:35:37 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408132035.i7DKZbPT009208@webmail2.magma.ca>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter mailing list <netfilter@lists.netfilter.org>

On Aug 13, "Daniel Chemko" <dchemko@smgtec.com> wrote:
> 
> dravya wrote:
> >>> Hello all,
> >>> 
> >>> I have a system setup with two phones/interfaces (ppp0 and ppp1). I
> >>> access the internet via these two interfaces only.
> >>> 
> >>> I have the following rules in my iptables:
> >>> 
> >>> iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
> >>> iptables -t nat -A POSTROUTING -o ppp1 -j MASQUERADE
> >>> 
> >>> and yet when a machine on my network uses my machine as the gateway
> >>> to ping outside, packets travel on the wrong link causing change of
> >>> ip address of the phones. I have tested this using ethereal and it
> >>> clearly shows a ppp0 packet (src add of ppp0) outgoing on ppp1, as
> >>> I was capturing on ppp1. Also, iptables is masquerading as it shows
> >>> the number of packets it masqueraded.
> >> 
> >> I agree with you that the above rules ought to ensure that packets
> >> going out of each interface have the appropriate source address.
> >> 
> >> What does your routing table look like (presumably you are using
> >> iproute2 to balance traffic, or route based on source etc, to share
> >> the two links)? 
> > 
> > Yes I am using iproute2 and the Routing Table is as follows
> > 
> >  206.47.201.1 dev ppp1  proto kernel  scope link  src 204.101.96.143
> >  204.101.237.225 dev ppp0  proto kernel  scope link  src 69.158.211.67
> >  169.254.0.0/16 dev eth0  scope link
> >  192.168.0.0/16 dev eth0  scope link
> >  127.0.0.0/8 dev lo  scope link
> >  default equalize
> >       nexthop via 204.101.237.225  dev ppp0 weight 1
> >       nexthop via 206.47.201.1  dev ppp1 weight 1
> 
> 
> Ok, just to follow up, if you'd like to equalize the network based on my
> solution, you can use the nth target to balance traffic.
> 
> # INET3 should really be the internal interface of the network. I
> slipped up typing it.
> Replace:
> 	iptables -t mangle -A PREROUTING -i ${INET3} -m mark --mark 0 -j
> MARK ${MY_POLICY_DEFAULT}
> With:
> 	iptables -t mangle -A PREROUTING -i ${INET3} -m nth --every 2
> --packet 0 -m mark --mark 0 -j MARK ${MY_POLICY_ETH0}
> 	iptables -t mangle -A PREROUTING -i ${INET3} -m nth --every 2
> --packet 1 -m mark --mark 0 -j MARK ${MY_POLICY_ETH1}
> 
> Using nth, you can change the weight of the lines appropriately. If
> you'll notice, this solution equalizes based on full connections, not on
> raw bandwidth usage. Raw usage can't be properly equalized on an
> non-bonded line (One IP, many lines). So, what this means is that you
> won't get clean 1-1 bandwidth distribution, but if you want that, you
> should be looking into the lartc side of things.

You mention these rules for my scenario... but can I use ppps instead of eth0 and eth1. 
Also, we have implemented a TCP cache (makes sure (ties to) that packets of each session
go over the correct link) and a load balancing alogrithm. I am guessing these rules will
override them. As of right now I don't know what exactly your mentioned rules are doing ..
. but how exactly is the load balancing working? for more than 2 links? ..... How exactly
does it mark a packet? Does it modify the actual packet? 

This will be a big step for me, as then I am guessing we will not need our own created TCP
cache and load balancing. 

Will all these rules work for only icmp if I wanted? just use -p icmp? Would it at all
conflict with TCP packets???

Thank so so very much for your input. After much looking around I have found someone that
knows a great deal on this. 

Appreciate it if you can answer my questions. As you can tell I am a total newbie on this.
Is there any documentation regarding these issues?

cheers
Dravya


