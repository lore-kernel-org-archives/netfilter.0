From: "Hoeschen, Chris" <Chris.Hoeschen@primevest.net>
Subject: RE: Access to Internal server via public address
Date: Wed, 10 Dec 2003 14:36:54 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <189F4CA4494FB344827F2A4FC0020C443906C7@stca437000.common.ecamericas>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: netfilter <netfilter@lists.netfilter.org>

Can I ask why you want to access the internal server using the external
IP address?

To get around this for myself I setup a internal only DNS server inside
my network to resolve names to internal IP addresses.  This is separate
from my externally facing DNS server that is resolving my external IP
address to the DNS names.  This way all I need to do is access my
internal server via the DNS name instead of the IP address.

=20

                                       =20
Chris Hoeschen=20
Distributed System Analysts        =20
PrimeVest Financial Services                    =20
Phone: (320) 656-4035=20
Fax: (320) 656-4088=20
E-Mail: chris.hoeschen@primevest.net


"Only two things are infinite, the universe and human stupidity, and I'm
not sure about the former."
  -- Albert Einstein=20

Hippopotomonstrosesquippedaliophobia is the fear of long words=20



-----Original Message-----
From: Antony Stone [mailto:Antony@Soft-Solutions.co.uk]=20
Sent: Wednesday, December 10, 2003 2:26 PM
To: netfilter
Subject: Re: Access to Internal server via public address


On Wednesday 10 December 2003 8:16 pm, William Stearns wrote:

> Good afternoon, Vernon,
>
> On 10 Dec 2003, Vernon A. Fort wrote:
> > Anyone,
> >
> >   The Problem:  I have an alias public address DNAT'ed to and=20
> > internal address - normal and working
> >
> >   What i need is to access this server using the PUBLIC address from

> > an internal workstation.

> 	If the client box and the internal server in question are on the
same=20
> cable, you essentially can't do this direcdtly (but read on).
>
> 	Picture this as a triangle; the internal machines on the bottom,

> (client left, server right) and the firewall at the top.  The packets=20
> physically all travel over the same Ethernet segment shared by all=20
> three machines, I'm just demonstrating who's talking to whom.

Excellent answer, Bill.

I think this explains a common situation (and a common FAQ) in more
detail,=20
and with more information, than I've seen before.   Hopefully it is
clear to=20
a network non-expert as well (I don't use the term newbie here, because
once=20
you've got DNAT working at all, you've clearly gone beyond that
stage...)

Your reply is (IMHO) worthy of a FAQ entry in itself.

Antony

--=20
What is this talk of "software release"?
Our software evolves and matures until it is capable of escape, leaving
a=20
bloody trail of designers and quality assurance people in its wake.

                                                     Please reply to the
list;
                                                           please don't
CC me.







