From: Alexandru Gheorghe <alghe.global@gmail.com>
Subject: LKM with hook that catches iptables hits
Date: Wed, 25 Jun 2014 10:37:36 +0300
Message-ID: <53AA7C40.2010707@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="lqXT0Bk2FjJrh5ITVslHP3oLK93JITUAT"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type;
        bh=MA9dGaU9ALi8+yoJEhUjDuLwulo0UBf6abaJOsAbCyQ=;
        b=xi149OL4PdwH8XT5uZySO3A3ExjkHlLY7SnUsH20g/eJWLyuqOCruDX+Z7FQMpZ65D
         QGYgjiBB4lwTBB0jFk1SaDStro4LwSiRAFS2gVLo2hAUJ6JWwHGK2DGr8fSnYYf0ucxv
         2T+33pAj92Zy57UlrTWckEmM+WichVCZ0G8srkgb0/cc9GRd+Mn2KwV++SY2U253zxHa
         BRYFCtTBkisrv+IaQ9E3wXsX5wDhHN241zG6ibfRlb/YmgNgyXmAjnYmVEjAegmGPaTp
         uqcuux1VK3+KHoCgLyhoBqZ4QMbCycmh8V4HT9Cp0K/QAHMGHUrQq5oKHJii8SliZQ04
         fTSA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--lqXT0Bk2FjJrh5ITVslHP3oLK93JITUAT
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi guys. I am trying to think of an LKM which could have a general hook
in the sense that whatever iptables defines from user space this hook
will catch when a rule is hit (every rule) and will log it (KERN_INFO).

I do not want to define an NFLOG for each rule (that will be tedious,
especially in a machine dedicated as a firewall for example). Is this
even possible?

The general purpose is to have a method of tracking all packets in order
to see what chains/rules are hit.

This will make possible to observe the routes some packets travel when
they travel the firewall's layout. The kernel is a 2.6.32.x one.


Thank you for any feedback or input, gratefully appreciated.
--=20
; Alexandru Gheorghe
; alghe.global {at} gmail {dot} com
; OpenPGP key ID 0xCAF985D2


--lqXT0Bk2FjJrh5ITVslHP3oLK93JITUAT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJTqnxDAAoJEM2Jx0DK+YXSZm4P/j1p3gkfyD0AUjkhe9IRn/AW
gfnYAE52KDRPNvdK5JexoQmbFVpmRjMP3RA8NS3AcewuZ28f3piTUAKuvRkaoG+b
Y6NHuKZMFOuGSYJyRqWgvQrgsyu5j6LpJC8WIH6m23GO3m56YDafZuSVuM7ay9xj
N6zxTvGIlu/Qgl7Vkq/5W9sMkLv2UO1neTQqq4Z5Jbs57NJa6i3/JtNFta5A1AYd
tJX3oQKCeDZpCigXd7lewI0hPyXtNu247cJHT4Sxb+jO/gPk2UbxXuU7MNTZAZfQ
rPlPYeAvucnsLSiuyAZpVZrrmhrUyiIFJRsre2FQmi6NLYcR0kjuWk8i2S2ZFx8G
W95AsE6ht9O2WWF6nd3o9dq2qG0BbcZIrd7PDyEGH/Y2Hr6KhnAM5Yppyl5Wvj0N
6zT81Ff0tyTUsvTN6aoO1UT0zg1ZdPN13dc+42b9n0n0q9EGa+pY1Suy6jti7XIE
sV8W/BCOU8P7nBjdlD/IDp7QTfPaUU76VldYZnnKwfFULN23qI3kejOk8zkwGN30
Br5u61PJJiHzCRiamoj6K78/vJFsGBuG5XGMhWLsc2gDI3PW23bQdPs5jFFijx5F
rSr/TptbMvneE2ZMJOWxxU4Ely2Hg9XIT+tHLHT+VccA5O8vFMBPrhDmfHCvjvJj
B1rOZet2LkaJTWtFXJwL
=6BAQ
-----END PGP SIGNATURE-----

--lqXT0Bk2FjJrh5ITVslHP3oLK93JITUAT--
