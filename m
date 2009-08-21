From: Simon Ruderich <simon@ruderich.org>
Subject: Re: nmap scan makes my apache connection  super slow
Date: Fri, 21 Aug 2009 16:57:30 +0200
Message-ID: <20090821145730.GA16700@ruderich.org>
References: <4A8E638D.8040006@infoservices.in>
 <4A8EB06A.6060400@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256; protocol="application/pgp-signature"; boundary="=_zucker.schokokeks.org-27653-1250866639-0001-2"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4A8EB06A.6060400@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

This is a MIME-formatted message.  If you see this text it means that your
E-mail software does not support MIME-formatted messages.

--=_zucker.schokokeks.org-27653-1250866639-0001-2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2009 at 04:34:18PM +0200, Pascal Hambourg wrote:
> Make an exception to the syn flood protection for TCP port 80 (or any
> port apache listens on), with at least a much higher limit than 1/s. How
> high ? Well, as high as your system can take without choking.

As a side note somebody doesn't need to SYN-flood Apache to bring
it down, have a look at Slowloris [1].

Simon

[1]: http://ha.ckers.org/slowloris/
--=20
+ privacy is necessary
+ using http://gnupg.org
+ public key id: 0x92FEFDB7E44C32F9

--=_zucker.schokokeks.org-27653-1250866639-0001-2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Transfer-Encoding: 7bit
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iQIcBAEBCAAGBQJKjrXaAAoJEJL+/bfkTDL5ShkP/AtasPx5+wU9ZfEFo4hZkD+6
bngm0EIXtZ0jJX3NZC4Vp93tdx3Ps3jJMSbfjTbWO2+Jc3Bf40QBfU2quaTa4vru
KlMw4OQkANfZoJYcYN8IdXwfV3H5xDgn/3XzVmYvZFyrP60TrPZ28pAST1LmPnn4
wxFinjRWRXDNXpvgyIBezNZRc8HJt/iv+M/4FfGyA/XKNwZKjLcY6ooIWe7rbCq4
wu8eukFdGAaQ7VRiZSVKzz8PwDMj8HhPI1YVlh+UObxzzYFfVGblQGOYCagvdWtS
VPIhWrPrG23e9VDsv8GvUx4B6uCMheg0NhujSxudYm3/cuUPN6p+5l3OpO/+93g+
1KCztqDiDZ+IGeYrH3GTrIwACvYUzSAW2gq4JFV/JX4uoAAtVoS5rQ7KtywpuLX3
0y2HhPJ+Y37eRBiDuAWRDQuZcN+O7TCMX0FpzzmVcSHX4Cq26W37qgOi8yl46tcF
QprwTUGNNkVBmfxjfYZnSWUBx+mURfYvBCqZjewPPxLPaIIKnapGeACFtUwlhdch
g24ZU48u8SbkaSX96xBpwTc+STCRnzBu6nMUL37/1OagbFixUx3qYGlsJ22AdO8y
zaOJGphpbF8Np4Qz0dLL7GKuqmaTANRd0LDVSzwnwpIyqzMSrooNudHU1p/YYP7h
7JSlB7kzxhJyrDhp0W2p
=jo3Q
-----END PGP SIGNATURE-----

--=_zucker.schokokeks.org-27653-1250866639-0001-2--
