From: Dale Mellor <dale@rdmp.org>
Subject: Re: How to stop kernel TCP responses on a port
Date: Tue, 09 Sep 2014 14:49:19 +0100
Message-ID: <1410270559.5380.9.camel@l3>
References: <1409843867.3026.9.camel@l3> <54089069.8010603@solutti.com.br>
		 <1409891253.15027.24.camel@l3>
	 <CBD8736BE6044AE0B06076D69855AF85@gmail.com> <1409895712.16431.7.camel@l3>
	 <540D1E4F.4000704@fnarfbargle.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-oZk6XAPq6fjGWub+YjqZ"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <540D1E4F.4000704@fnarfbargle.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Brad Campbell <lists2009@fnarfbargle.com>
Cc: netfilter@vger.kernel.org


--=-oZk6XAPq6fjGWub+YjqZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2014-09-08 at 11:11 +0800, Brad Campbell wrote:
> On 05/09/14 13:41, Dale Mellor wrote:
> >
>=20
> > Anyway, the point is I don't want the syn-ack to come from the ground,
> > but the Linux kernel insists on sending it.  That's what I want to
> > filter out, or otherwise stop.
>=20
>=20
> The kernel only does that if there is a piece of application code that=
=20
> is bound to that socket.
>=20
> > In case I haven't been clear, the PC is the gateway to the spacecraft;
> > effectively, it _is_ the proxy.  When a telnet client (on the ground)
> > connects to the gateway (on the ground), the gateway is responding to
> > the SYN when I don't want it to.
>=20
> Ok, so the ground station PC is acting as a proxy and you don't want=20
> that. You want it to *route* the IP packets rather than be an=20
> application level proxy.
>=20
> So at the moment you are connecting to a socket that is bound in the=20
> ground station PC. There is a piece of code there than binds and then=20
> accepts the connection. Stop doing that and have iptables forward/nat=20
> the packets instead.
>=20
> If all that is incorrect, then you have not provided anywhere enough=20
> information on the how's and why's.


Thanks for all your thoughts.  It is likely true I didn't give enough
information for you to fully understand my problem, but I didn't have
time to write an essay and there is only so much I'm allowed to
disclose.

Anyway, for information, my solution was to vector packets to my port in
the PREROUTING chain of the mangle table to target QUEUE, and then have
a user-land program feed the packet to the space link.  This program
instructs the kernel to DROP the frame, and the kernel does not then
send any SYN-ACK or RST itself to the connecting client, which is what I
wanted to achieve.

Thanks again,
Dale


--=-oZk6XAPq6fjGWub+YjqZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEABEKAAYFAlQPBWAACgkQykcf1QFhiklbgACfROfumksns0IeSXMg4b4Zn4+w
Sk0Anj6kGiQUNM5F0P7SSmKq6A/cAejI
=g998
-----END PGP SIGNATURE-----

--=-oZk6XAPq6fjGWub+YjqZ--

