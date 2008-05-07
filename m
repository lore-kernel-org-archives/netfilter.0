From: Josh Cepek <josh.cepek@usa.net>
Subject: Re: SNAT spoofing problem
Date: Wed, 07 May 2008 16:12:31 -0500
Message-ID: <48221B3F.5020507@usa.net>
References: <4821ED37.3020201@trilunar.ca>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig2567A0F3189237E70D52B85D"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4821ED37.3020201@trilunar.ca>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Gary Renshaw <gary@trilunar.ca>, netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig2567A0F3189237E70D52B85D
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Gary Renshaw wrote:
> I am trying to get a host to reject pings with an ICMP=20
> host-unreachable message so that it looks like the host doesn't=20
> exist.  This is easy and works nicely.

This will not do what you want for several reasons.  On a local network, =

the "host unreachable" condition is identified by the system _sending_=20
the pings when there is no ARP reply from the target host; this means=20
that any local host can know the "stealth" host is up from the ARP=20
reply.  This method also won't work beyond most gateways unless you have =

the cooperation of the gateway; most gateways are configured with=20
firewalls that prevent spoofing across subnets, and thus it will drop=20
any packets with invalid source addresses on them.  In your diagram=20
anything upstream from the gateway would receive replies from the WAN=20
(or upstream) IP address, not the LAN, and the gateway won't (or at=20
least shouldn't) accept LAN packets sourced with an IP on a different=20
network.

If your goal is to hide the "stealth" host from clients on the local=20
network, it's pointless; ARP's give you away as a live host anyway, and=20
there's no way to "fix" that without breaking TCP/IP functionality=20
all-together.

> The problem is that I'd like to use SNAT to spoof the source address=20
> so that the ICMP looks like it is coming from the network's gateway,=20
> not the stealthy host.  This isn't working the way I expected.
>
> I've set up a very simple test rig for this.
>
> 192.168.1.1 (GATEWAY) <-----> 192.168.1.2 (STEALTH)
>                          |
>                          \--> 192.168.1.3 (WORKSTATION)

--=20
Josh



--------------enig2567A0F3189237E70D52B85D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)

iEYEARECAAYFAkgiG0MACgkQHSSgJy5aUSeuLwCggGKwAbJo0rd4hK6KZ0Cwco/g
LUsAnA20RK9sKeQejOGS5IvMz9Wug4To
=zuks
-----END PGP SIGNATURE-----

--------------enig2567A0F3189237E70D52B85D--

