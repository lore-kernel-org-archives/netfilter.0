From: Nikolai Lusan <nikolai@lusan.id.au>
Subject: Re: Redirect question
Date: Sun, 23 Mar 2014 08:32:58 +1000
Message-ID: <1395527578.7702.57.camel@localhost>
References: <20140322133802.GA5012@fever.havannah.local>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-MjqxkPlbpKk4YTWjFYBY"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20140322133802.GA5012@fever.havannah.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Danny <dannydebont@gmail.com>
Cc: netfilter@vger.kernel.org


--=-MjqxkPlbpKk4YTWjFYBY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2014-03-22 at 15:38 +0200, Danny wrote:

> However, all internal clients can still connect to the internet if I do n=
ot tell
> them to go through the proxy.

You need to to a DNAT on the packets before they hit the net.



> How would I go about routing all the local clients to squid's port 3128?

iptables -t NAT - A PREROUTING -p tcp --dport 80 -j DNAT\
--to-destination <squid_IP>:3128

that is the simplest way - you do need to change some of the squid
config though. These days the TPROXY method is preferred though you
should read http://wiki.squid-cache.org/Features/Tproxy4

Also it's worth reading more about DNAT and TPROXY in the man pages.

--=20
Nikolai Lusan <nikolai@lusan.id.au>

--=-MjqxkPlbpKk4YTWjFYBY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABCgAGBQJTLg+aAAoJEJOjmtAqHQSL2ugQAKSbZz0W284hdDttEflnRVaq
A+FEDZAw+YCNCgxeUAGbOb+LrH0+xNUB+3yo5dz5evk9sAj+abIhMjuUxmfFuRiB
VWkBmizPr7XoK6u5nhjLvMdgl2yfuXS3BB6x1379Yx3rBxRpxCD9w0pF17xiTZtr
IbAydlXWxIng9PD92jp3Z3KjnyUxFd4mKK5kO373yPJib8I7M6Ule5RLb7Ky023X
K3+KDY+yLFlkSBQBEtBX/Cgdh+EIPUb+ED+7nykSWcdnfHfdjP9QP8YN3xpqjtT2
nnSguJmmtMOJvjC4SnClI7r87GkXHkEumccEen4FiwVksR9wR5FCL4+L3pQS8jBr
QaWidJsBFtfaboLofb3obvZgIikJy1zmOqmpMkVrKjBW+MzBBdd17o7VaPDp8Zxt
+LyS6opcnaTfaD95AxmkkwVe2E9ThrNgG1hpceVRct28GOR5l5Zf/eG/4FsFnXSL
dBy8d5cuw0+i0eaA2pfGCAkWQXGHUTzmUaHw03ZpWUSjxtib4cO8zjQNKtwF6bTF
Jxjzu4cPYeTAkfiX8o6Q9JmR0GiDrYAG4DTo7J8rODm6yvsyRWsbmSz3t8kyh0if
MLIR3TUWzh+78OW9uuxBWidqWBpAvF6HVVouRvTMVwMuoIxrZeBu0VU59aB2WJHy
5IHDDDRkt0LH2u7Fi1pa
=5rug
-----END PGP SIGNATURE-----

--=-MjqxkPlbpKk4YTWjFYBY--

