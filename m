From: "Suzana Lojic-Skoric" <s_lojic@hotmail.com>
Subject: Re: DNS and NAT
Date: Thu, 14 Jul 2005 08:50:18 -0700
Message-ID: <BAY17-F22074E1DF13F87E0D94A0C80D10@phx.gbl>
References: <42D668C1.4060801@mnemon.de>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42D668C1.4060801@mnemon.de>
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
Content-Type: text/plain; format=flowed; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: harmuth@mnemon.de, netfilter@lists.netfilter.org

>From: J=F6rg Harmuth <harmuth@mnemon.de>
>To: netfilter@lists.netfilter.org
>Subject: Re: DNS and NAT
>Date: Thu, 14 Jul 2005 15:29:37 +0200
>
>Suzana Lojic-Skoric schrieb:
>
> > I have an internal network that has one set of addresses and outside
> > network that has
> > a different set of addresses. I am using NAT for the sole purpose of
> > translation. Both inside and outside network have DNS servers, mail
> > servers,.... Both networks need to talk to each other, send mail and
> > request web pages... I have a control of inside network but not the
> > outside ntw.
> >
> > When the client from outside sends a DNS query to the inside ntw I guess
> > I can implement split DNS as Jason Opperisano suggested and get it
> > working that way. The outside world will get a web page from external
> > view and will have answer from global outside address, the inside world
> > will get answer from internal view with inside global ip.
> >
> > The problem is I don't understand how it is supposed to work when the
> > client is inside and sending a request for a page whose server happens
> > to be outside...
> > I have a default route through the NAT, so when a client on the inside
> > network
> > sends a DNS query it goes out through the NAT, in my case both source
> > and destination gets translated and forwarded to outside DNS server.( I
> > have to translate the destination as well because the clients on
> > internal network send a request to an internal DNS server with the
> > internal IP address as destination. So the request gets forwarded to the
> > outside world through the NAT and both SNAT-ed and DNAT-ed.) When the
> > answer comes back to NAT, the outside source and destination IP gets
> > translated back to the internal addresses, but the actual IP that
> > resolves the requested page is embedded in the message, and it does not
> > get translated ( it is outside IP) When the client gets the answer, it
> > processes it, gets the outside IP from the message and try talk to it.
> > But this is outside IP and inside clients can't route to it.
> >
> > I am trying to understand how is this supposed to work. I can't quite
> > use the wisdom from masquerade because masquerade is simpler, masquerade
> > messages are only SNAT-ed, meaning only source address is translated and
> > when the request comes back it is then DNAT-ed to internal network,
> > meaning destination is translated so the message can find your machine.
> > But you don't care that google.com resolved as 216.239.39.99 because
> > your NAT is one way NAT in you can talk to 216.239.39.99. In my case, I
> > have to translate the 216.239.39.99 to something else (for example
> > 10.1.1.1) so that the inside network can talk to it. And then on the
> > exit through the nat 10.1.1.1 will be translated back to 216.239.39.99.
> > The problem is I have no way of translating the 216.239.39.99 to
> > 10.1.1.1 because iptables NAT does not inspect the payload of the DNS
> > answer and does not translate it. ... and this is how iptables is
> > supposed to work.
>
>If I understand everything correctly, your problem is something alike
>"How can my clients find google.com ? My clients have non-routable
>addresses (RFC1918), so they cannot talk to routable addresses". Your
>szenario: Client starts DNS request for google.com to internal DNS. This
>box returns 216.239.39.99 to the client and the client doesn't know how
>to get there. Right ?
>
>Hmm, your client already knows how to get to 216.239.39.99, because he
>has a default route to the nat box (as you said above). The nat box
>recieves something like
>
>src=3D10.0.0.1 dst=3D216.239.39.99 spt=3D22222 dpt=3D80
>
>This is not local to the nat box, so - if /proc/sys/net/ipv4/ip_forward
>is set to 1 - the nat box will forward the packet to its default
>gateway, say via ppp0. If you applied MASQUERADE to ppp0, the source
>address is rewritten to the (internet) address of ppp0 and the packet
>reaches google.
>
>The return package from google hits your nat box and the connection
>tracking code automatically "retranslates" (this time the destination
>address) to 10.0.0.1 and the package reaches your client. That's all. A
>rule like
>
>iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
>
>and everything is as described.
>
Yes, you are right, but the problem is between my inside client and the NAT=
=20
gateway I have a machine that drops everything that is not 10.x.x.x. I know=
,=20
I know, it is insane... but my job is to find a solution for DNS in such=20
network.

So basically, my inside network can only route 10.x.x.x and everything else=
=20
is dropped.

>As /dev/rob0 pointed out, if you don't want your clients to talk with
>google directly use proxies.
>

I'll check out the proxy idea. Thanks for your input.

Suzana

>Sorry, if I missed the point.
>
>Joerg
>
>
>

_________________________________________________________________
Powerful Parental Controls Let your child discover the best the Internet ha=
s=20
to offer.=20
http://join.msn.com/?pgmarket=3Den-ca&page=3Dbyoa/prem&xAPID=3D1994&DI=3D10=
34&SU=3Dhttp://hotmail.com/enca&HL=3DMarket_MSNIS_Taglines=20
  Start enjoying all the benefits of MSN=AE Premium right now and get the=20
first two months FREE*.


