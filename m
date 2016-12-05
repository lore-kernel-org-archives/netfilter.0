From: "Brian J. Murrell" <brian@interlinx.bc.ca>
Subject: Re: DNAT working for one host but not another
Date: Mon, 05 Dec 2016 09:43:28 -0500
Message-ID: <1480949008.19944.60.camel@interlinx.bc.ca>
References: <1480878101.19944.29.camel@interlinx.bc.ca>
         <1480878397.19944.31.camel@interlinx.bc.ca>
         <aab4caed2f9f4941b0749ef4875d5761@aalto.fi>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-cOftplRKteY5xr9VKlij"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <aab4caed2f9f4941b0749ef4875d5761@aalto.fi>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org


--=-cOftplRKteY5xr9VKlij
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2016-12-05 at 07:04 +0000, Llorente Santos Jesus wrote:
> Hi Brian,
>=20
> Did you try using the REDIRECT target instead?

I didn't before, but I just did and it doesn't seem to work either.=20
Neither host gets ASSURED:

udp      17 26 src=3D10.75.23.212 dst=3D10.75.22.8 sport=3D6060 dport=3D237=
68 [UNREPLIED] src=3D10.75.22.247 dst=3D10.75.23.212 sport=3D5060 dport=3D6=
060 mark=3D0 secctx=3Dsystem_u:object_r:unlabeled_t:s0 use=3D1
udp      17 28 src=3D10.75.22.200 dst=3D10.75.22.8 sport=3D6060 dport=3D237=
68 [UNREPLIED] src=3D10.75.22.8 dst=3D10.75.22.200 sport=3D23768 dport=3D60=
60 mark=3D0 secctx=3Dsystem_u:object_r:unlabeled_t:s0 use=3D1

and they both just keep getting ICMP port unreachable:

09:36:59.717222 IP 10.75.23.212.6060 > 10.75.22.8.23768: UDP, length 472
09:36:59.717340 IP 10.75.22.8 > 10.75.23.212: ICMP 10.75.22.8 udp port 2376=
8 unreachable, length 508
09:37:01.839127 IP 10.75.22.200.6060 > 10.75.22.8.23768: UDP, length 472
09:37:01.839212 IP 10.75.22.8 > 10.75.22.200: ICMP 10.75.22.8 udp port 2376=
8 unreachable, length 508
09:37:03.718815 IP 10.75.23.212.6060 > 10.75.22.8.23768: UDP, length 472
09:37:03.718921 IP 10.75.22.8 > 10.75.23.212: ICMP 10.75.22.8 udp port 2376=
8 unreachable, length 508
09:37:05.218391 IP 10.75.22.200.6060 > 10.75.22.8.23768: UDP, length 0

There is definitely something listening on the port:

# netstat -pan | grep :5060
udp=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A00 10.75.22.8:5060=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A00.0.0.0:*=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A032519/foo

But it really should work as a DNAT rule anyway.  It does for one host,
just not another.  And has worked as such for all hosts for many years.
 I just seems to have stopped working recently.

Interestingly enough, it seems that now, the host which can't move to
the ASSURED state is getting an ICMP port unreachable from the host:

09:20:47.041363 IP 10.75.22.200.6060 > 10.75.22.8.23768: UDP, length 471
09:20:47.041586 IP 10.75.22.8 > 10.75.22.200: ICMP 10.75.22.8 udp port 2376=
8 unreachable, length 507

Yet the other host obviously managed to reach it:

udp      17 179 src=3D10.75.23.212 dst=3D10.75.22.8 sport=3D6060 dport=3D23=
768 src=3D10.75.22.8 dst=3D10.75.23.212 sport=3D5060 dport=3D6060 [ASSURED]=
 mark=3D0 secctx=3Dsystem_u:object_r:unlabeled_t:s0 use=3D1
udp      17 26 src=3D10.75.22.200 dst=3D10.75.22.8 sport=3D6060 dport=3D237=
68 [UNREPLIED] src=3D10.75.22.8 dst=3D10.75.22.200 sport=3D23768 dport=3D60=
60 mark=3D0 secctx=3Dsystem_u:object_r:unlabeled_t:s0 use=3D1

I wonder if that sheds any more light on the problem.

Cheers,
b.

--=-cOftplRKteY5xr9VKlij
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAABCAAGBQJYRX0RAAoJENrB0DQWy8igOxYH/AgmbHsdaBopTQPoTPId+xTg
9b8yQYZufH81+UDS7AC7GMA9/rEFg1h4E6iHjsIJ0qZLGpVCT49bEu+SdtblNZ7N
KHlcpBsjdFgRwTOzF6H6w1gFJ/aXMq4ujkBmF+MO4zvSC6ZnaMwSLvBfh3bvEhqj
jJ2dsOva+aFRf2Z4IjqRQMv6gdSBjK0i81WM46QKrQWaKmWBCGIuuwtJIMR8EDMJ
ejMlMng4wHYiN04aE/SgO9TudZE5QDsGCeftoIhLTK5DBXLAj0nbrnfodxApWQbq
mQ5cIQsX4Kzkjni84MLEUEuURUWjiCS8mcvciKPh3brngtBbJ15ExheWYpqdWuI=
=hrju
-----END PGP SIGNATURE-----

--=-cOftplRKteY5xr9VKlij--


