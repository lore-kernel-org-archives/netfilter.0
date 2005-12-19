From: Adam Rosi-Kessel <adam@rosi-kessel.org>
Subject: Re: Why would certain packets not reach nat PREROUTING chain?
Date: Mon, 19 Dec 2005 10:40:58 -0500
Message-ID: <43A6D48A.1020508@rosi-kessel.org>
References: <20051218055403.002CDA00EA@bostoncoop.net>
	<20051218131621.GC2197@bostoncoop.net>
	<12626109102.20051219163925@wbp.krakow.pl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig815474B8B358DA78E1CBCCFC"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <12626109102.20051219163925@wbp.krakow.pl>
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
To: Marcin Krol <mark@wbp.krakow.pl>
Cc: netfilter@lists.netfilter.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig815474B8B358DA78E1CBCCFC
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Marcin Krol wrote:
> Hello Adam,
> Look at point 6.3 here:
> http://iptables-tutorial.frozentux.net/iptables-tutorial.html
> There was smth in the tutorial about only the first packet from NEW
> connection hitting the chains and the rest of them being handled by
> conntrack, although can't remember where exactly this was located in
> tutorial.
> This would explain the UDP traffic being handled in its entirety
> since UDP is connectionless and conntrack.

Hi Marcin:

I'm not exactly sure what you mean by the last sentence--did you leave of=
f a
word or two?

I think what you're saying is that the subsequent packets aren't showing =
up
in nat PREROUTING because they're being tracked. This makes sense--once a=

connection is tracked or ASSURED the packets don't go through nat PREROUT=
ING
anymore. And the connection in question *is* being tracked -- it shows up=
 in
/proc/net/ip_conntrack as ASSURED.

Even though the connection is tracked, the traffic *doesn't* show up when=

watching the inward facing network card with ethereal or tcpdump.  With
other tracked connections (for example, an ssh or http connection) I see =
all
traffic with tcpdump: coming from internal client to nat box, nat box to
external server, then back from external server to nat box, and from nat =
box
to internal client. With this connection, however, I see 3 out of 4 with
tcpdump -- the traffic comes back into the nat box from the outside, is
apparently properly tracked according to /proc/net/ip_conntrack, but it
never leaves again on the internal facing network card.
--=20
Adam Rosi-Kessel
http://adam.rosi-kessel.org


--------------enig815474B8B358DA78E1CBCCFC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFDptSKdTf3ZklQ6qYRAjMaAJ944ZlXfpPWBEG2Nnan2rMQ/dayYwCfdbNa
NG8iIysJ8cFb3jqGN16OKIk=
=LCG8
-----END PGP SIGNATURE-----

--------------enig815474B8B358DA78E1CBCCFC--

