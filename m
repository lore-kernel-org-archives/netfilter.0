From: Karina <kgs@acabtu.com.mx>
Subject: Re: How to send all packets to a router
Date: Sun, 24 Feb 2002 19:42:04 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3C79966C.5B80DDA@acabtu.com.mx>
References: <3C792059.865B267B@acabtu.com.mx> <200302241310.52400.Alistair@nerdnet.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: Alistair@nerdnet.ca
Cc: netfilter@lists.netfilter.org

I don't think the location of the rule is the problem. It seems that this=
 line
is changing the final destination ip, instead of setting a next hop for m=
y
route, i think this because if i ping an external host as yahoo, the ping
command returns me values or <10 ms , that are exactly the same values fo=
r the
ping for the alternate router. So the ping is not reaching yahoo, it seem=
s is
reaching only the router as a final destination, instead of routing the
packets.


Karina.


Alistair Tonner wrote:

> On February 24, 2002 12:18 pm, Karina wrote:
> > Hi, i have this problem..
> >
> > I have an iptables-box, that is the default gateway for all my intern=
al
> > addresses, after this box all the packets are sending to my main rout=
er.
> > But now, I need to send one of my internal Class C to another router
> > instead of the main one.
> >
> > I try with this line:
> >
> > $IPTABLES -T NAT -a PREROUTING -i eth0 -s $THISCLASS -j DNAT --to
> > other.router.ip
> >
> > but it seems this is not working.
> >
> > If i setup a computer and i put as gateway directly the new router ip
> > all works. But , if i setup this same comptuer and i put as gateway m=
y
> > iptables-box (all the computers have this settings) this doesn't work.
> > The packets sent by my other ip addresses are going to main router as
> > usual, but the other class is not going to the alternate router.
> >
> > Any ideas ?
>
>         Perhaps you have the order of the NAT rules incorrect?
>         This rule should occurr in the table *before* the default one
>         that routes the rest of your network.
>
>         Alistair

--
LSCI Karina G=F3mez Salgado
mailto:kgs@acabtu.com.mx
Systems Administrator & Web Projects Manager

BTU Comunicaci=F3n, S.A. de C.V.



