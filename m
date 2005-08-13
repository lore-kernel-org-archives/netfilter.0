From: Thilo Schulz <arny@ats.s.bawue.de>
Subject: Re: Blocking Google Earth
Date: Sat, 13 Aug 2005 04:31:19 +0200
Message-ID: <200508130431.24772.arny@ats.s.bawue.de>
References: <20050812201225.CE6DD2128@juno.tc.df.gov.br>
	<42FD06B6.4080209@imag.fr>
	<20050812223230.14D0920EB@juno.tc.df.gov.br>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart16291819.XksiFK56HH";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050812223230.14D0920EB@juno.tc.df.gov.br>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
To: netfilter@lists.netfilter.org

--nextPart16291819.XksiFK56HH
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Saturday 13 August 2005 00:38, fabricio bianco abreu wrote:
> I would like to block it because a user using Google Earth consumes about
> 256kbps bandwith. I have 600+ users and only a 2Mbps link to the Internet.

I don't see how you would do that without doing a packet inspection for all=
=20
packets directed at www.google.com, as maps.google.com is - as you=20
undoubtedly already know - is an alias for www.google.com
You would have to do packet inspection and filter for maps.google.com. This=
=20
could be easily circumvented by using an SSL capable proxy.

Maybe QoS could do the trick for you. While allowing access to google earth=
,=20
it might discourage that user from excessively using it by restricting his=
=20
bandwidth to something like 64kbit/s while google itself is still perfectly=
=20
usable. It is generally a sensible idea to make use of QoS on a setup like=
=20
yours.

=2D-=20
Thilo Schulz

--nextPart16291819.XksiFK56HH
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBC/Vt8Zx4hBtWQhl4RAmuBAKCm9QcIWSKcfT9g2Sl/Ua1GKhAYSwCguCde
tLrVEsvJQeDemYu41kZWztI=
=JO07
-----END PGP SIGNATURE-----

--nextPart16291819.XksiFK56HH--

