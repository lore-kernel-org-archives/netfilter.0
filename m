From: KOVACS Krisztian <hidden@sch.bme.hu>
Subject: Re: ip_conntrack table is full with razor requests. Something	isn't
 timing out.
Date: Wed, 02 Mar 2005 11:14:19 +0100
Message-ID: <1109758459.3574.10.camel@nienna.balabit>
References: <4224A715.8030907@aptalaska.net>
	<Pine.LNX.4.62.0503012324020.3992@L01.THNET>
	<4224FF04.90205@aptalaska.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
In-reply-to: <4224FF04.90205@aptalaska.net>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Matthew Schumacher <matt.s@aptalaska.net>
Cc: netfilter@lists.netfilter.org


  Hi,

2005-03-01, k keltez=E9ssel 14.47-kor Matthew Schumacher ezt =EDrta:
> >> Since upgrading to 2.6.10 I have been having problems with my=
=20
> >> ip_conntrack table filling up.  It appears it is full of razor=
=20
> >> (http://razor.sf.net) requests from my internal mail server.
> >>
> > So I'm not the only one with these problems - I can confirm this=
=20
> > completely. It's razor and kernel 2.6.10 here too.
> >=20
> > [...]
> >=20
> > It would be great, if somebody could help us - or tell us, what=
=20
> > information one should supply...
> >=20
> > Thanks in advance,
> > Michael
>=20
> Michael,
>=20
> Thanks for your note on this... looks like a netfilter bug to me.  =
Did=20
> you have any problems running 2.6.9?  I am looking at the diffs and=
 it=20
> looks like there are a number of changes to the ip_conntrack code i=
n=20
> 2.6.10.  When reading though the changelog for 2.6.11-rc5 it doesn'=
t=20
> appear that any of these issues are resolved, so I may have to go b=
ack=20
> to 2.6.9 if it is known to work.

  Could you try whether or not the following patch fixes your problem=
?

https://lists.netfilter.org/pipermail/netfilter-devel/2004-December/0=
17908.html

--=20
KOVACS Krisztian <hidden@sch.bme.hu>



