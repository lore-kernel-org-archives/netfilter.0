From: Eric Leblond <eric@inl.fr>
Subject: Re: pre 2.6.14 ip_queue - packet shrink issues?
Date: Fri, 28 Mar 2008 14:47:24 +0100
Message-ID: <20080328134723.GA23603@khasse.inl.fr>
References: <923426.65658.qm@web52412.mail.re2.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VbJkn9YxBvnuCH5J"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <923426.65658.qm@web52412.mail.re2.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Scott MacKay <scottmackay@yahoo.com>
Cc: netfilter@vger.kernel.org


--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Friday, 2008 March 28 at  6:07:47 -0700, Scott MacKay wrote:
> With ip_queue, under the older libipq style interface
> I seem to be having a problem resizing a mangled
> message smaller under 2.6.  It seems like the contents
> could be changed, but the receiver got the original
> packet size, like the trim failed or something.  Still
> need to check the details in ethereal, but from anyone
> using ip_queue or noting improvements in the new
> style, does an issue like this ring any bells?  Thanks
> in advance!

I think remember such an issue. It has been fixed and should work with
up-to-date code (I mean with libnetfilter_queue).

BR,
--=20
Eric Leblond
INL: http://www.inl.fr/
NuFW: http://www.nufw.org/

--VbJkn9YxBvnuCH5J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFH7PbrnxA7CdMWjzIRAtVmAJ0VhHbMfHH/a+7DhRQYwNLufWtqRQCeN7la
7QnTd5sQgOfIuWWmrRpq3ys=
=yhtQ
-----END PGP SIGNATURE-----

--VbJkn9YxBvnuCH5J--
