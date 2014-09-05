From: Dale Mellor <dale@rdmp.org>
Subject: Re: How to stop kernel TCP responses on a port
Date: Fri, 05 Sep 2014 06:41:52 +0100
Message-ID: <1409895712.16431.7.camel@l3>
References: <1409843867.3026.9.camel@l3> <54089069.8010603@solutti.com.br>
	 <1409891253.15027.24.camel@l3> <CBD8736BE6044AE0B06076D69855AF85@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-+8BCjpzm6wTMRJZtN0gA"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CBD8736BE6044AE0B06076D69855AF85@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Payam Chychi <pchychi@gmail.com>
Cc: Leonardo Rodrigues <leolistas@solutti.com.br>, netfilter@vger.kernel.org


--=-+8BCjpzm6wTMRJZtN0gA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


> > > On 04/09/14 12:17, Dale Mellor wrote:
> > > I want to do TCP with raw sockets. How can I filter away the
> > > kernel's
> > > RST/ACK/SYN response messages when I want to do this myself?
> >=20
> >=20
> > On Thu, 2014-09-04 at 13:16 -0300, Leonardo Rodrigues wrote:
> > you'll probably need to tweak the kernel itself for that. If you=20
> > wanna do all the 'dirty work', why not use UDP instead of TCP ??
> >=20
> >=20
> > On Thursday, September 4, 2014 at 9:27 PM, Dale Mellor wrote:
> > I need to tunnel TCP (specifically telnet) through a space link to a
> > spacecraft in orbit (don't worry, security exists in the link
> > layer).
> > But of course I need the SYN/ACKs to come from the spacecraft itself
> > (rather than the ground-station PC) so I know when I can send
> > commands
> > up. I'm going to try to use the iptables' QUEUE target and a
> > user-space
> > packet filter, thinking that if I reject the incoming SYN it will be
> > dropped without further ado, and then I can synthesize a response
> > later
> > with a raw socket.
> >=20
> >=20
> > Any thoughts people may have on this would likely be useful.
>=20
>=20
On Thu, 2014-09-04 at 22:06 -0700, Payam Chychi wrote:
Why would the syn-ack come from the ground pc and not the space station?
Are you proxying this? If so, there are other ways todo this ...



I thought this list had rules about not top-posting?

Anyway, the point is I don't want the syn-ack to come from the ground,
but the Linux kernel insists on sending it.  That's what I want to
filter out, or otherwise stop.

In case I haven't been clear, the PC is the gateway to the spacecraft;
effectively, it _is_ the proxy.  When a telnet client (on the ground)
connects to the gateway (on the ground), the gateway is responding to
the SYN when I don't want it to.

Dale


--=-+8BCjpzm6wTMRJZtN0gA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEABEKAAYFAlQJTSAACgkQykcf1QFhikkTTACfQe5N3XTlaxsItjHEKDGoaIE6
n00AniVKBZzvbKzbBpZKGr6teG6Zd3pX
=Y/Sx
-----END PGP SIGNATURE-----

--=-+8BCjpzm6wTMRJZtN0gA--

