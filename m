From: Athan <netfilter@miggy.org>
Subject: Re: port redirection *without* nat
Date: Mon, 6 Jan 2003 23:25:54 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030106232554.GL16581@miggy.org>
References: <20030106141753.A12922@infinity.rhythm.cx>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HLsZ5Z1opAQvdr2J"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030106141753.A12922@infinity.rhythm.cx>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org


--HLsZ5Z1opAQvdr2J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 06, 2003 at 02:17:53PM -0500, sm@rhythm.cx wrote:
> I'm trying to figure out how (if possible) to do port redirection with
> iptables on my linux router. This router is is not doing NAT, all connect=
ed
> networks have real, public IP addresses. There is tons of information out
> there about doing port redirection with NAT, but I can't find anything for
> without NAT. I just want to make the router take traffic destined for
> address A port x and change the destination address to send it off to
> address B port x instead. A and B are on the same (directly attached
> ethernet) network. I looked into the DNAT and REDIRECT targets, but those
> only seem to work in the nat table.

   Um, think about it.   You DO want 'NAT' of some sort for this.

Connection comes in from 1.2.3.4:1234 destined to A:x.  You want this to
be handled by B:x.  So you use a DNAT or REDIRECT to re-write the
destination, good, now have the connection ultimately ending up at B:x.
But as far as 1.2.3.4:1234 is concerned it IS talking to A:x, so the
return packets MUST be rewritten to come back from A:x, which is what
DNAT will do.
  If you want B:x to completely handle the connection then you need the
clients to be just connecting to it directly in the first place, with
requisite INPUT/FORWARD rules setup to allow this.

-Ath
--=20
- Athanasius =3D Athanasius(at)miggy.org / http://www.miggy.org/
                  Finger athan(at)fysh.org for PGP key
	   "And it's me who is my enemy. Me who beats me up.
Me who makes the monsters. Me who strips my confidence." Paula Cole - ME

--HLsZ5Z1opAQvdr2J
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj4aEIIACgkQzbc+I5XfxKcZWgCfQYaXuAZYALeAmn3Qk0FP2OMr
bHQAnimcAD5Z+75qFGc0q+4NVgvLuwFZ
=A9Ir
-----END PGP SIGNATURE-----

--HLsZ5Z1opAQvdr2J--

