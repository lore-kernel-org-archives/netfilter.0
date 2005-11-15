From: Adam Rosi-Kessel <adam@rosi-kessel.org>
Subject: Re: Why would certain packets not reach nat PREROUTING chain?
Date: Tue, 15 Nov 2005 08:43:59 -0500
Message-ID: <4379E61F.5000807@rosi-kessel.org>
References: <4372A919.8020100@rosi-kessel.org>
	<4372A989.5090606@rosi-kessel.org>
	<20051110031834.GB9770@samad.com.au>
	<20051110032733.GA19073@bostoncoop.net>
	<3063e50511100055m41abd50hc3af78a67896db7d@mail.gmail.com>
	<20051114145348.GA12841@bostoncoop.net>
	<Pine.LNX.4.58.0511141559360.1983@blackhole.kfki.hu>
	<4378A8B1.8010206@rosi-kessel.org>
	<Pine.LNX.4.58.0511150855520.4319@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig644B3020268256916839F69D"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.58.0511150855520.4319@blackhole.kfki.hu>
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
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@lists.netfilter.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig644B3020268256916839F69D
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Jozsef Kadlecsik wrote:
>> Okay--would it be sufficient to grep on port 500? conntrack tracks by =
port,
>> right? So as long as there are *no* entries in ip_conntrack for port 5=
00 at
>> any point while I'm trying to make this connection, doesn't it mean th=
at
>> conntrack isn't handling the packets?
> Yes. And if conntrack does not handle them, NAT won't do either.

Actually, now that I've *triple*-checked, I got a different result. I'm n=
ot
sure why this wasn't happening before, or if I was misreading the
ip_conntrack table, but now I *am* seeing the connection in question on p=
ort
500.  It is marked as ASSURED which I understand to mean that two way
traffic has occurred.

So, setting aside the question of why I wasn't seeing that before, should=
n't
I be able to see the incoming packets as they are routed to the internal
client machine, even if they are tracked connections?  When I watch the
inward-facing interface with tcpdump, I don't see any of these packets
getting routed to that machine, although I do see the outbound packets.

Does that mean that something is going wrong with the connection tracking=
,
or that I'm misunderstanding tcpdump, or something else?
--=20
Adam Rosi-Kessel
http://adam.rosi-kessel.org


--------------enig644B3020268256916839F69D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFDeeYhdTf3ZklQ6qYRAoYkAJ9EvcEAELkCgzmDlIHpd+l6eUdikACgtD88
JWvlgmFL0gEjNPQs3Zd83bE=
=h5rD
-----END PGP SIGNATURE-----

--------------enig644B3020268256916839F69D--

