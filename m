From: "Luis Fernando Barrera" <luba@assist.com.gt>
Subject: RE: SNAT
Date: Wed, 13 Nov 2002 10:33:36 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <NABBIDJPNCAGKGOFGHBFKEKHPIAA.luba@assist.com.gt>
References: <002801c28b18$45b2d8e0$2c00a8c0@PERUCCHI>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <002801c28b18$45b2d8e0$2c00a8c0@PERUCCHI>
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
To: Breno Cardoso Perucchi <brenol@omegatec.net>, "Netfilter (E-mail)" <netfilter@lists.netfilter.org>


You mean you want to send your DNS queries to your ISP DNS server?

I guess you have a DNS server? O just want to consult (as a client) your ISP
DNS server?




-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Breno Cardoso
Perucchi
Sent: Wednesday, November 13, 2002 07:26
To: Netfilter (E-mail)
Subject: Re: SNAT


Everybody is talking about DNS tcp/udp. But I want know how I can do that my
traffic go to out as my IP_NET and not another IP. I know that I have to use
SNAT for to do this.

My problem is that my DNS this going out with IP NAT(Masquerade)
Somebody can help me

----- Original Message -----
From: "Rob Sterenborg" <rsterenborg@xs4all.nl>
To: "Netfilter (E-mail)" <netfilter@lists.netfilter.org>
Sent: Wednesday, November 13, 2002 9:21 AM
Subject: RE: SNAT


> > > > > iptables -t nat -I POSTROUTING -p udp -s 192.168.0.1 --sport 53 -j
> > > > > SNAT --to-source 200.200.200.1:53
>
> > > > I don't know if dns traffic is always sent *from* 53/udp, but I do
> > > > know it is always sent *to* 53/udp.
>
> > > Not *always* :-)   Sometimes it goes to 53/tcp...
>
> > I think that the DNS traffic goes only on 53/tcp when transfering
> > zones, and it uses the 53/udp for the queries.
> >
> > Also, if you use the BIND implementation of the DNS server, you
> > can specify the source port, so the traffic can go from
> > 53/udp to 53/udp
>
> Of course you're right.
> Anyway, I interpret the original question as how to SNAT normal dns
traffic
> because the rule he wrote was using the udp protocol for *source* port
> 53/udp, which doesn't have to match *all* dns traffic (if it does).
> That's why I mentioned that I don't know if dns traffic always come *from*
> port 53/udp (here it doesn't ; it uses some port above 1024), but I do
know
> it's going *to* port 53/udp.
>
>
> Rob
>
>
>




