From: Athan <netfilter@miggy.org>
Subject: Re: Should i be worried?
Date: Tue, 28 Jan 2003 23:24:11 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030128232411.GG11221@miggy.org>
References: <000c01c2c71c$bd541090$0200a8c0@whyzpc>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UFHRwCdBEJvubb2X"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <000c01c2c71c$bd541090$0200a8c0@whyzpc>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Erik Ahlner <whyz@home.se>
Cc: netfilter@lists.netfilter.org


--UFHRwCdBEJvubb2X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 28, 2003 at 11:29:36PM +0100, Erik Ahlner wrote:
> Hello!
>=20
> I just happened to do a dmesg, and got this output:
>=20
> IN=3Deth0 OUT=3Deth0 SRC=3D192.168.0.186 DST=3D130.236.230.9 LEN=3D74 TOS=
=3D0x00
> PREC=3D0x00 TTL=3D127 ID=3D14459 PROTO=3DUDP SPT=3D137 DPT=3D53 LEN=3D54
> IN=3Deth0 OUT=3Deth0 SRC=3D192.168.0.186 DST=3D130.236.230.9 LEN=3D74 TOS=
=3D0x00
> PREC=3D0x00 TTL=3D127 ID=3D14715 PROTO=3DUDP SPT=3D137 DPT=3D53 LEN=3D54
> IN=3Deth0 OUT=3Deth0 SRC=3D192.168.0.88 DST=3D217.209.28.135 LEN=3D48 TOS=
=3D0x00
> PREC=3D0x00 TTL=3D127 ID=3D37469 DF PROTO=3DTCP SPT=3D2418 DPT=3D80 WINDO=
W=3D16384
> RES=3D0x00 SYN URGP=3D0
>=20
>=20
> As you can see, i get some message about traffic from 192.168.0.186 and .=
88
> .. these two computers are NOT in my home network, so i guess that someone
> has named his computers like that on the university network, even though =
the
> university network has 130.236.x.x.
> Is this a problem for me?
> And what does this output actually mean?
> Has someone used my computer as a router?
> If they have, how is that possible?
> This is what my iptable looks like:
>=20
> $IPTABLES -P INPUT ACCEPT
> $IPTABLES -F INPUT
> $IPTABLES -P OUTPUT ACCEPT
> $IPTABLES -F OUTPUT
> $IPTABLES -P FORWARD DROP
> $IPTABLES -F FORWARD
> $IPTABLES -t nat -F
>=20
> $IPTABLES -A FORWARD -i $EXTIF -o $INTIF -j ACCEPT
> $IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT
> $IPTABLES -A FORWARD -j LOG
                       ^^^^^^
This is what causes the messages in dmesg.  You probably want to change
the INPUT rule below to be a FORWARD one.  Make sure to put it ABOVE the
two other FORWARD rules above, otherwise they'll get the packet first
and just pass it anyway.

> $IPTABLES -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE
> $IPTABLES -A INPUT -s 192.168.0.0/24 -i eth0 -j DROP

  Actually, just go find a DECENT fw script and use that ;).

HTH,

-Ath
--=20
- Athanasius =3D Athanasius(at)miggy.org / http://www.miggy.org/
                  Finger athan(at)fysh.org for PGP key
	   "And it's me who is my enemy. Me who beats me up.
Me who makes the monsters. Me who strips my confidence." Paula Cole - ME

--UFHRwCdBEJvubb2X
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj43ERsACgkQzbc+I5XfxKcBmwCgmEAccEbmdmSje5T1Ju6hnGlA
NSQAni+Sb/grMNW1iOMt/Ee2FnnJFMCO
=3I0I
-----END PGP SIGNATURE-----

--UFHRwCdBEJvubb2X--

