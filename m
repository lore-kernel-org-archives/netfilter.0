From: Eduardo =?ISO-8859-1?Q?Fern=E1ndez?= <eduardo@cmusanjuan.com>
Subject: Re: [OT] Traffic from ff:ff:ff:ff:ff:ff in switched environment
Date: Tue, 16 Nov 2004 23:37:21 +0100
Message-ID: <1100644641.1647.25.camel@laserite>
References: <1100641554.1647.10.camel@laserite>
	<1100642540.3695.60.camel@hubcap.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1100642540.3695.60.camel@hubcap.ljm.dom>
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
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

El mar, 16-11-2004 a las 17:02 -0500, Jason Opperisano escribi=F3:
> it's more likely that ff:ff:ff:ff:ff:ff is the destination mac, not the
> source...

Nope, I was quite surprised too, but that's the src mac.

> arp "who-has" packets are vital to the proper functioning of a local
> area network--it's how each host finds the MAC address associated with
> each IP on the network.

I've seen some viruses lately trying to forge their ip/mask, maybe this
is the cause, since I've never since traffic FROM that mac.

> the volume of traffic you're seeing is a symptom of the fact that you
> have a /16 configured as a flat, switched network.
>=20
> the guy that i learned TCP/IP networking from once told me a good
> guideline is to never have more than 1024 hosts in a single layer-2
> broadcast domain, as the broadcast traffic becomes unmanageable.  he
> knew a whole lot more than i ever will--so i try to stick to that when =
i
> (re)design a network.

Mmm, it's a /16 but I don't have more than about 500 computers. Maybe I
should resize the network to a /22 or so.

Thank you very much,

Eduardo


