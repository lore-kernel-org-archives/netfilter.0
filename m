From: "Suzana Lojic-Skoric" <s_lojic@hotmail.com>
Subject: Re: DNS and NAT
Date: Mon, 11 Jul 2005 13:33:34 -0700
Message-ID: <BAY17-F385E7ADF96986B0821571980DC0@phx.gbl>
References: <20050711194113.GA17435@bender.817west.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050711194113.GA17435@bender.817west.com>
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
To: netfilter@lists.netfilter.org

OK, thanks I was not sure what is the proper behavior regarding iptables an=
d=20
DNS.

If answer is not translated then how do I get DNS to work with two way NAT?
My internal network does not understand any of the ip addresses that belong=
=20
to outside. So if the request for a page that is sent from internal network=
=20
comes back from outside with an answer (ip address) that is not getting=20
translated then I can't resolve the page since my internal network doesn't =

understand it and can't route to it.
Is there a way around this problem? How do I get DNS to work in the type of=
=20
environment I described?

Thanks


>From: Jason Opperisano <opie@817west.com>
>To: netfilter@lists.netfilter.org
>Subject: Re: DNS and NAT
>Date: Mon, 11 Jul 2005 15:41:13 -0400
>
>On Mon, Jul 11, 2005 at 12:37:31PM -0700, Suzana Lojic-Skoric wrote:
> > Does DNS work with iptables NAT or I need some kind of ALG to get DNS
> > answers translated?
> >
> > I am using Mandrake Linux 10.0. I have two way NAT going on and I am=20
>trying
> > to get DNS requests through the NAT. I got FTP, HTTP and SMTP working
> > through the NAT, but DNS is not working properly, DNS answer is not=20
>getting
> > translated.
>
>nor should it be.
>
> > Source and Destination addresses in DNS message are properly
> > translated, but the actual answer (the ip address embedded in the=20
>message)
> > is not translated.
>
>which is exactly how it's supposed to work.  how the $%#@ is iptables
>supposed to know what to rewrite the answer to?
>
>if you are using BIND, look into the functionality offered by "views."
>
>-j
>
>--
>"Peter: You know, I oughta just give you some beer. Goes straight
>  through you.
>  Stewie: Wonderful. And while we're at it, we can light up a doobie and
>  watch porn.
>  Peter: Eh... yeah?"
>         --Family Guy
>

_________________________________________________________________
Designer Mail isn't just fun to send, it's fun to receive. Use special=20
stationery, fonts and colors.=20
http://join.msn.com/?pgmarket=3Den-ca&page=3Dbyoa/prem&xAPID=3D1994&DI=3D10=
34&SU=3Dhttp://hotmail.com/enca&HL=3DMarket_MSNIS_Taglines=20
  Start enjoying all the benefits of MSN=AE Premium right now and get the=20
first two months FREE*.


