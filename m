From: Athan <netfilter@miggy.org>
Subject: Re: ECN mangling
Date: Fri, 27 Dec 2002 09:17:00 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021227091659.GB1878@miggy.org>
References: <20021227073624.GA1878@miggy.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EuxKj2iCbKjpUGkD"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20021227073624.GA1878@miggy.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Netfilter Users <netfilter@lists.netfilter.org>


--EuxKj2iCbKjpUGkD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 27, 2002 at 07:36:24AM +0000, Athanasius wrote:
> iptables -t mangle -A OUTPUT -o eth1 -p tcp -d IP/32 --match ecn --ecn-ip=
-ect 0 -j ECN --ecn-tcp-remove
>=20
> 07:32:02.470307 80.4.77.247.33919 > 212.250.5.117.80: S [bad tcp cksum bf=
40!] 322522142:322522142(0) win 5840 <mss 1460,sackOK,timestamp 2077600 0,n=
op,wscale 0> (DF) (ttl 64, id 65470, len 60)
>=20
> and the packets never seem to do much.  Of course once I'd added a few
> -v's to tcpdump as above I can see the problem "[bad tcp cksum bf40!]".
> It would seem that mangling the packet in this way is causing the tcp
> checksum to become invalid.

  I should have said this before.  This is specifically using kernel
2.4.21-pre21, no additional patches, and iptables-1.2.7a as provided in
Debian unstable (I grabbed the source the compiled and installed it on a
Debian stable/woody/3.0 system).

  Looking at latest CVS there doesn't seem to be any changes to the code
in net/ipv4/netfilter/ipt_ECN.c.  Not being uptospeed with how the code
all works it looks like it should be working:

     89         if (diffs[0] !=3D *tcpflags) {
     90                 diffs[0] =3D htons(diffs[0]) ^ 0xFFFF;
     91                 diffs[1] =3D htons(*tcpflags);
     92                 tcph->check =3D csum_fold(csum_partial((char *)diff=
s,
     93                                                     sizeof(diffs),
     94                                                     tcph->check^0xF=
FFF));
     95                 (*pskb)->nfcache |=3D NFC_ALTERED;
     96=20
     97                 return 1;
     98         }

But it obviously isn't.

-Ath
--=20
- Athanasius =3D Athanasius(at)miggy.org / http://www.miggy.org/
                  Finger athan(at)fysh.org for PGP key
	   "And it's me who is my enemy. Me who beats me up.
Me who makes the monsters. Me who strips my confidence." Paula Cole - ME

--EuxKj2iCbKjpUGkD
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj4MGosACgkQzbc+I5XfxKdZfwCgmCo95+HTXiEO70jaejoBQkD8
b1cAnA64BV5NDYvAKwmbCejzZf9zXnfK
=bjdd
-----END PGP SIGNATURE-----

--EuxKj2iCbKjpUGkD--

