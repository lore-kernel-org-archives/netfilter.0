From: Dale Mellor <dale@rdmp.org>
Subject: Re: How to stop kernel TCP responses on a port
Date: Fri, 05 Sep 2014 05:27:33 +0100
Message-ID: <1409891253.15027.24.camel@l3>
References: <1409843867.3026.9.camel@l3> <54089069.8010603@solutti.com.br>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-lrCnc57PDDGcdgW+voUU"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <54089069.8010603@solutti.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Leonardo Rodrigues <leolistas@solutti.com.br>
Cc: netfilter@vger.kernel.org


--=-lrCnc57PDDGcdgW+voUU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> On 04/09/14 12:17, Dale Mellor wrote:
>     I want to do TCP with raw sockets.  How can I filter away the kernel'=
s
>  RST/ACK/SYN response messages when I want to do this myself?

On Thu, 2014-09-04 at 13:16 -0300, Leonardo Rodrigues wrote:
      you'll probably need to tweak the kernel itself for that. If you=20
 wanna do all the 'dirty work', why not use UDP instead of TCP ??

   I need to tunnel TCP (specifically telnet) through a space link to a
spacecraft in orbit (don't worry, security exists in the link layer).
But of course I need the SYN/ACKs to come from the spacecraft itself
(rather than the ground-station PC) so I know when I can send commands
up.  I'm going to try to use the iptables' QUEUE target and a user-space
packet filter, thinking that if I reject the incoming SYN it will be
dropped without further ado, and then I can synthesize a response later
with a raw socket.

   Any thoughts people may have on this would likely be useful.

Thanks,
Dale


--=-lrCnc57PDDGcdgW+voUU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEABEKAAYFAlQJO7UACgkQykcf1QFhiklFVgCaA12ZnwcycYfSRJ8eZv9Ckihm
MeoAoIRTxrLGOBqO0UfQDAeMvRcWJuOo
=/2u7
-----END PGP SIGNATURE-----

--=-lrCnc57PDDGcdgW+voUU--

