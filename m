From: "dravya" <dravya@magma.ca>
Subject: Re: Masqureading issues... packets go over wrong link
Date: Fri, 13 Aug 2004 13:39:16 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408131739.i7DHdGQ0026395@webmail2.magma.ca>
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


> > Hello all,
> >
> > I have a system setup with two phones/interfaces (ppp0 and ppp1). I access
> > the internet via these two interfaces only.
> >
> > I have the following rules in my iptables:
> >
> > iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
> > iptables -t nat -A POSTROUTING -o ppp1 -j MASQUERADE
> >
> > and yet when a machine on my network uses my machine as the gateway to ping
> > outside, packets travel on the wrong link causing change of ip address of
> > the phones. I have tested this using ethereal and it clearly shows a ppp0
> > packet (src add of ppp0) outgoing on ppp1, as I was capturing on ppp1.
> > Also, iptables is masquerading as it shows the number of packets it
> > masqueraded.
> 
> I agree with you that the above rules ought to ensure that packets going out 
> of each interface have the appropriate source address.
> 
> What does your routing table look like (presumably you are using iproute2 to 
> balance traffic, or route based on source etc, to share the two links)?

Yes I am using iproute2 and the Routing Table is as follows

 206.47.201.1 dev ppp1  proto kernel  scope link  src 204.101.96.143
 204.101.237.225 dev ppp0  proto kernel  scope link  src 69.158.211.67
 169.254.0.0/16 dev eth0  scope link
 192.168.0.0/16 dev eth0  scope link
 127.0.0.0/8 dev lo  scope link
 default equalize
      nexthop via 204.101.237.225  dev ppp0 weight 1
      nexthop via 206.47.201.1  dev ppp1 weight 1

Obviously when the ip addresses change this table is updated.

Thanks
Dravya

