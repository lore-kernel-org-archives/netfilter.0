From: Adam Ellis <aellis@saberlogic.com>
Subject: Re: SMTP Routing Based On Recipient
Date: Tue, 23 Dec 2003 08:00:55 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1072184455.708.2.camel@localhost.localdomain>
References: <1072121282.10935.12.camel@localhost.localdomain>
	 <1072179452.2184.286.camel@grendel>
Reply-To: aellis@saberlogic.com
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-5voLGjgQUMIfqBd2UEbY"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1072179452.2184.286.camel@grendel>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Chris Brenton <cbrenton@chrisbrenton.org>
Cc: netfilter@lists.netfilter.org


--=-5voLGjgQUMIfqBd2UEbY
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2003-12-23 at 06:37, Chris Brenton wrote:
> On Mon, 2003-12-22 at 14:28, Adam Ellis wrote:
> >
> > What I
> > am wondering is this - would it be possible to redirect SMTP to my Linu=
x
> > server, use iptables to check that the recipient matches a valid user
> > from a list I'd supply, and, if so, route the message to the Exchange
> > server?=20
>=20
> As others have mentioned, this is not an optimal choice. You *might* be
> able to hack things together using strings and tarpit, but it would be a
> kluge at best.
>=20
> A couple of other options:
> I use a combination of Sendmail, ClamAV, MimeDefang and Spamassassin to
> clean up all inbound e-mail before passing it off to my mail server. You
> can find a great tutorial on setting this up here:
> http://www.rudolphtire.com/mimedefang-howto/

Chris and everyone else in this thread,

Thanks for the information.  I think you all have me going in the right
direction now!

Regards,
AE

--=-5voLGjgQUMIfqBd2UEbY
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQA/6DyHTVqlkAkp0+wRAmVzAJ9Azuvn0ZUKFhF3U2+ZvSGWl3vvDACg0+Bd
CZVJC8NNsvZ2W4CIqeI0rEs=
=0FJ6
-----END PGP SIGNATURE-----

--=-5voLGjgQUMIfqBd2UEbY--

